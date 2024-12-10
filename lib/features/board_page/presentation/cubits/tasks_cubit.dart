import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kamban/features/board_page/data/models/remote/comment_model.dart';
import 'package:kamban/features/board_page/data/models/remote/section_model.dart';
import 'package:kamban/features/board_page/data/models/remote/task_model.dart';
import 'package:kamban/service_locator.dart';

import '../../domain/entities/section.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

part 'task_state.dart';
part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TaskCubitState> {
  late final TaskRepository repository;
  late final FirebaseAnalytics analytics;

  TasksCubit()
      : repository = sl<TaskRepository>(),
        analytics = sl<FirebaseAnalytics>(),
        super(const TaskCubitState.initial());

  bool get isSectionsLoaded => state is _Loaded && (state as _Loaded).data.sections.isNotEmpty;

  Future<void> loadSectionsAndTasks(String projectID) async {
    try {
      emit(const TaskCubitState.loading());
      final sectionsDto = await repository.getAllSections(projectID);
      final sections = sectionsDto.map((dto) => dto.toDomain()).toList();

      final taskDtos = await repository.getAllTasks(projectID);
      final tasks = taskDtos.map((dto) => dto.toDomain()).toList();

      log('sections ${sections.length} tasks: ${tasks.length}}');

      analytics.logEvent(name: 'sections_loaded', parameters: {'sections_count': sections.length});
      analytics.logEvent(name: 'tasks_loaded', parameters: {'task_count': tasks.length});
      emit(TaskCubitState.loaded(TaskState(tasks: tasks, sections: sections)));
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> addTask(String content) async {
    try {
      final currentState = state;
      if (currentState is _Loaded) {
        final todoSectionId = currentState.data.sections.firstOrNull?.id;
        if (todoSectionId == null) return;
        final taskDto = await repository.addTask(content, todoSectionId);
        final task = taskDto.toDomain();
        await analytics.logEvent(name: 'task_added', parameters: {'task_content': content});
        final updatedTasks = [...currentState.data.tasks, task];
        final updated = currentState.data.copyWith(tasks: updatedTasks);
        emit(TaskCubitState.loaded(updated));
      }
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final taskDto = await repository.updateTask(task.id, task.content);
      final updatedTask = taskDto.toDomain();
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.data.tasks.map((t) {
          return t.id == task.id ? updatedTask : t;
        }).toList();
        final updated = currentState.data.copyWith(tasks: updatedTasks);
        emit(TaskCubitState.loaded(updated));
      }
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await repository.deleteTask(taskId);
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.data.tasks.where((task) => task.id != taskId).toList();
        await analytics.logEvent(name: '$taskId ', parameters: {'task': 'Task deleted'});
        final updated = currentState.data.copyWith(tasks: updatedTasks);
        emit(TaskCubitState.loaded(updated));
      }
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> moveTask(Task updatedTask) async {
    try {
      repository.moveTask(updatedTask.id, updatedTask.sectionId);

      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.data.tasks.map((task) {
          return task.id == updatedTask.id ? updatedTask : task;
        }).toList();
        final updated = currentState.data.copyWith(tasks: updatedTasks);
        emit(TaskCubitState.loaded(updated));
      }
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> loadComments(String taskId) async {
    try {
      final commentDtos = await repository.getAllComments(taskId);
      final comments = commentDtos.map((dto) => dto.toDomain()).toList();
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.data.tasks.map((task) {
          if (task.id == taskId) {
            return task.copyWith(comments: comments);
          }
          return task;
        }).toList();
        final updated = currentState.data.copyWith(tasks: updatedTasks);
        emit(TaskCubitState.loaded(updated));
      }
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> addComment(String taskId, String content) async {
    try {
      final comment = (await repository.addComment(taskId, content)).toDomain();
      final currentState = state;
      if (currentState is _Loaded) {
        final updatedTasks = currentState.data.tasks.map((task) {
          if (task.id != taskId) return task;
          return task.copyWith(comments: [...task.comments, comment]);
        }).toList();
        await analytics.logEvent(
          name: 'comment_added',
          parameters: {'comment_added': '$taskId comment added $content'},
        );
        final updated = currentState.data.copyWith(tasks: updatedTasks);
        emit(TaskCubitState.loaded(updated));
      }
    } catch (e) {
      emit(TaskCubitState.error(e.toString()));
    }
  }

  Future<void> startTimer(String taskId) async {
    final currentState = state;
    if (currentState is _Loaded) {
      final updatedTasks = currentState.data.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(
            isTiming: true,
            sectionType: SectionType.inProgress,
          );
        }
        return task;
      }).toList();
      final updated = currentState.data.copyWith(tasks: updatedTasks);
      emit(TaskCubitState.loaded(updated));
    }
  }

  Future<void> stopTimer(String taskId, int timeSpent) async {
    final currentState = state;
    if (currentState is _Loaded) {
      await repository.closeTask(taskId, timeSpent);
      final updatedTasks = currentState.data.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(
            isTiming: false,
            timeSpent: task.timeSpent + timeSpent,
            sectionType: SectionType.done,
          );
        }
        return task;
      }).toList();
      final updated = currentState.data.copyWith(tasks: updatedTasks);
      emit(TaskCubitState.loaded(updated));
    }
  }
}
