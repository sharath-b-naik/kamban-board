import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kamban/core/shared/shared.dart';
import 'package:kamban/features/board_page/data/models/remote/section_model.dart';
import 'package:kamban/features/board_page/data/models/remote/task_model.dart';
import 'package:kamban/features/board_page/data/sources/remote_sources.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_sources_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late RemoteTasksDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = RemoteTasksDataSourceImpl(mockDio);
  });

  group('getAllSections', () {
    const projectID = 'project123';
    const apiResponse = [
      {'id': '1', 'name': 'Section 1'},
      {'id': '2', 'name': 'Section 2'}
    ];

    test('should return a list of SectionModel when the response is successful', () async {
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters'))).thenAnswer((_) async => Response(
            data: apiResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await dataSource.getAllSections(projectID);

      expect(result, isA<List<SectionModel>>());
      expect(result.length, 2);
      verify(mockDio.get('$BASE_REST_URL/sections', queryParameters: {'project_id': projectID})).called(1);
    });

    test('should throw an exception when the response is an error', () async {
      when(mockDio.get(any, queryParameters: anyNamed('queryParameters'))).thenAnswer((_) async => Response(
            data: 'Error',
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ));

      expect(() => dataSource.getAllSections(projectID), throwsException);
    });
  });

  group('addTask', () {
    const sectionId = 'section123';
    const content = 'New Task';
    const apiResponse = {'id': 'task1', 'content': content, 'section_id': sectionId};

    test('should return TaskModel when the response is successful', () async {
      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer((_) async => Response(
            data: apiResponse,
            statusCode: 201,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await dataSource.addTask(content, sectionId);

      expect(result, isA<TaskModel>());
      expect(result.content, content);
      verify(mockDio.post('$BASE_REST_URL/tasks', data: jsonEncode({'content': content, 'section_id': sectionId})))
          .called(1);
    });

    test('should throw an exception when the response is an error', () async {
      when(mockDio.post(any, data: anyNamed('data'))).thenAnswer((_) async => Response(
            data: 'Error',
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ));

      expect(() => dataSource.addTask(content, sectionId), throwsException);
    });
  });

  group('deleteTask', () {
    const taskId = 'task123';

    test('should complete without errors when response is successful', () async {
      when(mockDio.delete(any)).thenAnswer((_) async => Response(
            statusCode: 204,
            requestOptions: RequestOptions(path: ''),
          ));

      await dataSource.deleteTask(taskId);

      verify(mockDio.delete('$BASE_REST_URL/tasks/$taskId')).called(1);
    });

    test('should throw an exception when the response is an error', () async {
      when(mockDio.delete(any)).thenAnswer((_) async => Response(
            data: 'Error',
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ));

      expect(() => dataSource.deleteTask(taskId), throwsException);
    });
  });
}
