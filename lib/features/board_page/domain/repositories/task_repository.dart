import 'package:kamban/features/board_page/data/models/local/database_task.dart';
import 'package:kamban/features/board_page/data/models/remote/comment_model.dart';
import 'package:kamban/features/board_page/data/models/remote/task_model.dart';

import '../../data/models/remote/section_model.dart';

abstract class TaskRepository {
  Future<List<SectionModel>> getAllSections(String projectID);
  Future<List<TaskModel>> getAllTasks(String projectID);
  Future<TaskModel> addTask(String content, String sectionId);
  Future<CommentModel> addComment(String taskId, String content);
  Future<List<CommentModel>> getAllComments(String taskId);
  Future<bool> closeTask(String taskId, int timeSpent);
  Future<TaskModel> updateTask(String taskId, String content);
  Future<void> deleteTask(String taskId);
  List<DatabaseTask> getCompletedTasks();
  Future<bool> moveTask(String taskId, String sectionID);
}
