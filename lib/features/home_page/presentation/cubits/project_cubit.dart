import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../service_locator.dart';
import '../../data/models/project_model.dart';
import '../../domain/repositories/project_repository.dart';

part 'project_cubit.freezed.dart';
part 'project_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  late final ProjectsRepository repository;
  late final FirebaseAnalytics analytics;

  ProjectsCubit()
      : repository = sl<ProjectsRepository>(),
        analytics = sl<FirebaseAnalytics>(),
        super(const ProjectsState.initial());

  Future<void> loadProjects() async {
    try {
      emit(const ProjectsState.loading());
      final projects = await repository.getProjects();
      await analytics.logEvent(name: 'projects_loaded', parameters: {'projects_count': projects.length});
      emit(ProjectsState.loaded(projects));
    } catch (e) {
      emit(ProjectsState.error(e.toString()));
    }
  }
}
