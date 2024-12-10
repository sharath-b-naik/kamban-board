import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kamban/core/shared/shared.dart';
import 'package:kamban/features/board_page/data/models/local/database_comment.dart';
import 'package:kamban/features/board_page/data/models/local/database_task.dart';
import 'package:kamban/features/board_page/data/repositories/task_repository_impl.dart';
import 'package:kamban/features/board_page/data/sources/remote_sources.dart';
import 'package:kamban/features/board_page/domain/repositories/task_repository.dart';
import 'package:kamban/features/home_page/domain/repositories/project_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'features/completed_tasks_page/presentation/cubits/completed_tasks_cubit.dart';
import 'features/home_page/data/repositories/project_repository_impl.dart';
import 'features/home_page/data/sources/remote_source.dart';
import 'features/home_page/presentation/cubits/project_cubit.dart';
import 'firebase_options.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupDatabase();
  setupLocators();
}

Future<void> setupDatabase() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  Hive.registerAdapter(DatabaseTaskAdapter());
  Hive.registerAdapter(DatabaseSectionTypeAdapter());
  Hive.registerAdapter(DatabaseCommentAdapter());
  await Hive.openBox<DatabaseTask>('completedTasks');
}

void setupLocators() {
  // Register Dio
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $API_KEY',
        },
      ),
    ),
  );

  // Register TasksDataSource
  sl.registerLazySingleton<TasksDataSource>(() => RemoteTasksDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<ProjectRemoteDataSource>(() => ProjectRemoteDataSourceImpl(sl<Dio>()));

  // Register HiveBox
  sl.registerLazySingleton<Box<DatabaseTask>>(() => Hive.box<DatabaseTask>('completedTasks'));

  // Register TaskRepository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl<TasksDataSource>(), sl<Box<DatabaseTask>>()));
  sl.registerLazySingleton<ProjectsRepository>(() => ProjectsRepositoryImpl(sl<ProjectRemoteDataSource>()));

  // Register Firebase analytics
  sl.registerLazySingleton<FirebaseAnalytics>(() => FirebaseAnalytics.instance);

  // Register TasksCubit
  sl.registerFactory<ProjectsCubit>(() => ProjectsCubit());

  // Register CompletedTasksCubit
  sl.registerFactory<CompletedTasksCubit>(() => CompletedTasksCubit());
}
