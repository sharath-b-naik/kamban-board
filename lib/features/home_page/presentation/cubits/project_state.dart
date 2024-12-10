part of 'project_cubit.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.initial() = _Initial;
  const factory ProjectsState.loading() = _Loading;
  const factory ProjectsState.loaded(List<ProjectModel> tasks) = _Loaded;
  const factory ProjectsState.error(String message) = _Error;
}
