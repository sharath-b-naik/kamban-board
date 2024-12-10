import '../../data/models/project_model.dart';

abstract class ProjectsRepository {
  Future<List<ProjectModel>> getProjects();
}
