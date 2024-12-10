@GenerateMocks([TasksDataSource, Box])
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:kamban/features/board_page/data/models/local/database_task.dart';
import 'package:kamban/features/board_page/data/models/remote/section_model.dart';
import 'package:kamban/features/board_page/data/models/remote/task_model.dart';
import 'package:kamban/features/board_page/data/repositories/task_repository_impl.dart';
import 'package:kamban/features/board_page/data/sources/remote_sources.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_repository_impl_test.mocks.dart';

void main() {
  late TaskRepositoryImpl repository;
  late MockTasksDataSource mockDataSource;
  late MockBox<DatabaseTask> mockBox;

  setUp(() {
    mockDataSource = MockTasksDataSource();
    mockBox = MockBox<DatabaseTask>();
    repository = TaskRepositoryImpl(mockDataSource, mockBox);
  });

  group('getAllSections', () {
    const projectID = 'project123';
    const apiResponse = [
      SectionModel(id: '1', name: 'Section 1'),
      SectionModel(id: '2', name: 'Section 2'),
    ];

    test('should return a list of SectionModel from remote data source', () async {
      when(mockDataSource.getAllSections(any)).thenAnswer((_) async => apiResponse);

      final result = await repository.getAllSections(projectID);

      expect(result, apiResponse);
      verify(mockDataSource.getAllSections(projectID)).called(1);
    });
  });

  group('addTask', () {
    const sectionId = 'section123';
    const content = 'New Task';
    final taskModel =
        TaskModel(id: '1', content: '1', projectId: '1', creatorId: '1', createdAt: DateTime.now(), url: '1');

    test('should add a task through the remote data source', () async {
      when(mockDataSource.addTask(any, any)).thenAnswer((_) async => taskModel);

      final result = await repository.addTask(content, sectionId);

      expect(result, taskModel);
      verify(mockDataSource.addTask(content, sectionId)).called(1);
    });
  });

  group('closeTask', () {
    const taskId = 'task1';
    const timeSpent = 120;
    final taskModel =
        TaskModel(id: '1', content: '1', projectId: '1', creatorId: '1', createdAt: DateTime.now(), url: '1');
    final domainTask = taskModel.toDomain();

    test('should close a task and save to the local database', () async {
      when(mockDataSource.closeTask(taskId)).thenAnswer((_) async => true);
      when(mockDataSource.getTask(taskId)).thenAnswer((_) async => taskModel);
      when(mockBox.put(any, any)).thenAnswer((_) async => Future.value());

      final result = await repository.closeTask(taskId, timeSpent);

      expect(result, true);
      verify(mockDataSource.closeTask(taskId)).called(1);
      verify(mockDataSource.getTask(taskId)).called(1);
      verify(mockBox.put(taskId, DatabaseTask.fromTask(domainTask.copyWith(timeSpent: timeSpent)))).called(1);
    });
  });

  group('getCompletedTasks', () {
    final completedTasks = [
      DatabaseTask(
          id: '1',
          content: 'Task 1',
          timeSpent: 100,
          createdAt: DateTime.now(),
          sectionType: DatabaseSectionType.toDo,
          isTiming: false,
          sectionId: 'section1'),
    ];

    test('should return all completed tasks from the local database', () {
      when(mockBox.values).thenReturn(completedTasks);

      final result = repository.getCompletedTasks();

      expect(result, completedTasks);
      verify(mockBox.values).called(1);
    });
  });

  group('deleteTask', () {
    const taskId = 'task1';

    test('should delete a task through the remote data source', () async {
      when(mockDataSource.deleteTask(taskId)).thenAnswer((_) async => Future.value());

      await repository.deleteTask(taskId);

      verify(mockDataSource.deleteTask(taskId)).called(1);
    });
  });

  group('moveTask', () {
    const taskId = 'task1';
    const sectionId = 'section2';

    test('should move a task to another section', () async {
      when(mockDataSource.moveTask(taskId, sectionId)).thenAnswer((_) async => true);

      final result = await repository.moveTask(taskId, sectionId);

      expect(result, true);
      verify(mockDataSource.moveTask(taskId, sectionId)).called(1);
    });
  });
}
