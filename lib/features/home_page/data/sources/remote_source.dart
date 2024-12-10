import 'package:dio/dio.dart';

import '../../../../core/shared/shared.dart';
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Dio dio;
  ProjectRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProjectModel>> getProjects() async {
    try {
      final response = await dio.get('$BASE_REST_URL/projects');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => ProjectModel.fromJson(json)).where((e) => e.name != 'Inbox').toList();
      } else {
        throw Exception('Failed to fetch all tasks: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch all tasks: $e');
    }
  }
}
