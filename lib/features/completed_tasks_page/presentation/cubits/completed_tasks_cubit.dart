import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kamban/features/board_page/domain/entities/task.dart';
import 'package:kamban/features/board_page/domain/repositories/task_repository.dart';

import '../../../../service_locator.dart';

part 'completed_tasks_cubit.freezed.dart';
part 'completed_tasks_state.dart';

class CompletedTasksCubit extends Cubit<CompletedTasksState> {
  late final TaskRepository repository;

  CompletedTasksCubit()
      : repository = sl<TaskRepository>(),
        super(const CompletedTasksState.initial());

  Future<void> loadCompletedTasks() async {
    try {
      emit(const CompletedTasksState.loading());
      final databaseTasks = repository.getCompletedTasks();
      final tasks = databaseTasks.map((databaseTask) => databaseTask.toTask()).toList();
      if (tasks.isNotEmpty) {
        emit(CompletedTasksState.loaded(tasks));
      } else {
        emit(const CompletedTasksState.initial());
      }
    } catch (e) {
      emit(CompletedTasksState.error(e.toString()));
    }
  }
}
