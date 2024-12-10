import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kamban/core/shared/shared.dart';
import 'package:kamban/features/board_page/data/models/remote/comment_model.dart';
import 'package:kamban/features/board_page/data/models/remote/section_model.dart';
import 'package:kamban/features/board_page/data/models/remote/task_model.dart';
import 'package:uuid/uuid.dart';

abstract class TasksDataSource {
  Future<List<SectionModel>> getAllSections(String projectID);
  Future<List<TaskModel>> getAllTasks(String projectID);
  Future<TaskModel> addTask(String content, String sectionId);
  Future<CommentModel> addComment(String taskId, String content);
  Future<List<CommentModel>> getAllComments(String taskId);
  Future<bool> closeTask(String taskId);
  Future<TaskModel> updateTask(String taskId, String content);
  Future<void> deleteTask(String taskId);
  Future<TaskModel> getTask(String taskId);
  Future<bool> moveTask(String taskId, String sectionID);
}

class RemoteTasksDataSourceImpl extends TasksDataSource {
  final Dio dio;
  RemoteTasksDataSourceImpl(this.dio);

  @override
  Future<List<SectionModel>> getAllSections(String projectID) async {
    try {
      final response = await dio.get(
        '$BASE_REST_URL/sections',
        queryParameters: {'project_id': projectID},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data ?? [];
        return data.map((json) => SectionModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch all sections: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch all sections: $e');
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks(String projectID) async {
    try {
      final response = await dio.get(
        '$BASE_REST_URL/tasks',
        queryParameters: {'project_id': projectID},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => TaskModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch all tasks: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch all tasks: $e');
    }
  }

  @override
  Future<TaskModel> addTask(String content, String sectionId) async {
    try {
      final response = await dio.post(
        '$BASE_REST_URL/tasks',
        data: jsonEncode({'content': content, 'section_id': sectionId}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception('Failed to add task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  @override
  Future<CommentModel> addComment(String taskId, String content) async {
    try {
      final response = await dio.post(
        '$BASE_REST_URL/comments',
        data: jsonEncode({'task_id': taskId, 'content': content}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CommentModel.fromJson(response.data);
      } else {
        throw Exception('Failed to add comment: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  @override
  Future<List<CommentModel>> getAllComments(String taskId) async {
    try {
      final response = await dio.get(
        '$BASE_REST_URL/comments',
        queryParameters: {'task_id': taskId},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => CommentModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch comments: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }

  @override
  Future<bool> closeTask(String taskId) async {
    try {
      final response = await dio.post('$BASE_REST_URL/tasks/$taskId/close');

      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to close task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to close task: $e');
    }
  }

  @override
  Future<TaskModel> updateTask(String taskId, String content) async {
    try {
      final response = await dio.post(
        '$BASE_REST_URL/tasks/$taskId',
        data: jsonEncode({'content': content}),
      );

      if (response.statusCode == 200) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception('Failed to update task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    try {
      final response = await dio.delete('$BASE_REST_URL/tasks/$taskId');

      if (response.statusCode != 204) {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  @override
  Future<TaskModel> getTask(String taskId) async {
    try {
      final response = await dio.get('$BASE_REST_URL/tasks/$taskId');

      if (response.statusCode == 200) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch task: $e');
    }
  }

  @override
  Future<bool> moveTask(String taskId, String sectionID) async {
    try {
      final response = await dio.post(
        '$BASE_SYNC_URL/sync',
        data: FormData.fromMap({
          'commands': jsonEncode([
            {
              'type': 'item_move',
              'uuid': const Uuid().v4(),
              'args': {
                'id': taskId,
                'section_id': sectionID,
              }
            }
          ])
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to fetch task: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch task: $e');
    }
  }
}
