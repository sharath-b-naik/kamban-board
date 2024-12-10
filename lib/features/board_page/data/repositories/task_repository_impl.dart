import 'package:hive/hive.dart';
import 'package:kamban/features/board_page/data/models/local/database_task.dart';
import 'package:kamban/features/board_page/data/models/remote/comment_model.dart';
import 'package:kamban/features/board_page/data/models/remote/section_model.dart';
import 'package:kamban/features/board_page/data/models/remote/task_model.dart';
import 'package:kamban/features/board_page/domain/repositories/task_repository.dart';

import '../sources/remote_sources.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TasksDataSource remoteTasksDataSource;
  final Box<DatabaseTask> completedTasksBox;

  TaskRepositoryImpl(this.remoteTasksDataSource, this.completedTasksBox);

  @override
  Future<List<SectionModel>> getAllSections(String projectID) {
    return remoteTasksDataSource.getAllSections(projectID);
  }

  @override
  Future<List<TaskModel>> getAllTasks(String projectID) async {
    return await remoteTasksDataSource.getAllTasks(projectID);
  }

  @override
  Future<TaskModel> addTask(String content, String sectionId) async {
    return await remoteTasksDataSource.addTask(content, sectionId);
  }

  @override
  Future<TaskModel> updateTask(String taskId, String content) async {
    return await remoteTasksDataSource.updateTask(taskId, content);
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await remoteTasksDataSource.deleteTask(taskId);
  }

  @override
  Future<bool> closeTask(String taskId, int timeSpent) async {
    bool success = await remoteTasksDataSource.closeTask(taskId);
    if (success) {
      final taskModelTaskModel = await remoteTasksDataSource.getTask(taskId);
      final task = taskModelTaskModel.toDomain();
      await completedTasksBox.put(task.id, DatabaseTask.fromTask(task.copyWith(timeSpent: timeSpent)));
    }
    return success;
  }

  @override
  Future<List<CommentModel>> getAllComments(String taskId) {
    return remoteTasksDataSource.getAllComments(taskId);
  }

  @override
  Future<CommentModel> addComment(String taskId, String content) {
    return remoteTasksDataSource.addComment(taskId, content);
  }

  @override
  List<DatabaseTask> getCompletedTasks() {
    return completedTasksBox.values.toList();
  }

  @override
  Future<bool> moveTask(String taskId, String sectionID) {
    return remoteTasksDataSource.moveTask(taskId, sectionID);
  }
}
