import '../../domain/repositories/project_repository.dart';
import '../models/project_model.dart';
import '../sources/remote_source.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProjectModel>> getProjects() {
    return remoteDataSource.getProjects();
  }
}
