// Mocks generated by Mockito 5.4.4 from annotations
// in kamban/test/features/board_page/data/repositories/task_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:hive/hive.dart' as _i7;
import 'package:kamban/features/board_page/data/models/remote/comment_model.dart'
    as _i3;
import 'package:kamban/features/board_page/data/models/remote/section_model.dart'
    as _i6;
import 'package:kamban/features/board_page/data/models/remote/task_model.dart'
    as _i2;
import 'package:kamban/features/board_page/data/sources/remote_sources.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTaskModel_0 extends _i1.SmartFake implements _i2.TaskModel {
  _FakeTaskModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCommentModel_1 extends _i1.SmartFake implements _i3.CommentModel {
  _FakeCommentModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TasksDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTasksDataSource extends _i1.Mock implements _i4.TasksDataSource {
  MockTasksDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i6.SectionModel>> getAllSections(String? projectID) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllSections,
          [projectID],
        ),
        returnValue:
            _i5.Future<List<_i6.SectionModel>>.value(<_i6.SectionModel>[]),
      ) as _i5.Future<List<_i6.SectionModel>>);

  @override
  _i5.Future<List<_i2.TaskModel>> getAllTasks(String? projectID) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllTasks,
          [projectID],
        ),
        returnValue: _i5.Future<List<_i2.TaskModel>>.value(<_i2.TaskModel>[]),
      ) as _i5.Future<List<_i2.TaskModel>>);

  @override
  _i5.Future<_i2.TaskModel> addTask(
    String? content,
    String? sectionId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTask,
          [
            content,
            sectionId,
          ],
        ),
        returnValue: _i5.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #addTask,
            [
              content,
              sectionId,
            ],
          ),
        )),
      ) as _i5.Future<_i2.TaskModel>);

  @override
  _i5.Future<_i3.CommentModel> addComment(
    String? taskId,
    String? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addComment,
          [
            taskId,
            content,
          ],
        ),
        returnValue: _i5.Future<_i3.CommentModel>.value(_FakeCommentModel_1(
          this,
          Invocation.method(
            #addComment,
            [
              taskId,
              content,
            ],
          ),
        )),
      ) as _i5.Future<_i3.CommentModel>);

  @override
  _i5.Future<List<_i3.CommentModel>> getAllComments(String? taskId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllComments,
          [taskId],
        ),
        returnValue:
            _i5.Future<List<_i3.CommentModel>>.value(<_i3.CommentModel>[]),
      ) as _i5.Future<List<_i3.CommentModel>>);

  @override
  _i5.Future<bool> closeTask(String? taskId) => (super.noSuchMethod(
        Invocation.method(
          #closeTask,
          [taskId],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i2.TaskModel> updateTask(
    String? taskId,
    String? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTask,
          [
            taskId,
            content,
          ],
        ),
        returnValue: _i5.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #updateTask,
            [
              taskId,
              content,
            ],
          ),
        )),
      ) as _i5.Future<_i2.TaskModel>);

  @override
  _i5.Future<void> deleteTask(String? taskId) => (super.noSuchMethod(
        Invocation.method(
          #deleteTask,
          [taskId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<_i2.TaskModel> getTask(String? taskId) => (super.noSuchMethod(
        Invocation.method(
          #getTask,
          [taskId],
        ),
        returnValue: _i5.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #getTask,
            [taskId],
          ),
        )),
      ) as _i5.Future<_i2.TaskModel>);

  @override
  _i5.Future<bool> moveTask(
    String? taskId,
    String? sectionID,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #moveTask,
          [
            taskId,
            sectionID,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox<E> extends _i1.Mock implements _i7.Box<E> {
  MockBox() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<E> get values => (super.noSuchMethod(
        Invocation.getter(#values),
        returnValue: <E>[],
      ) as Iterable<E>);

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);

  @override
  bool get isOpen => (super.noSuchMethod(
        Invocation.getter(#isOpen),
        returnValue: false,
      ) as bool);

  @override
  bool get lazy => (super.noSuchMethod(
        Invocation.getter(#lazy),
        returnValue: false,
      ) as bool);

  @override
  Iterable<dynamic> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <dynamic>[],
      ) as Iterable<dynamic>);

  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);

  @override
  bool get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: false,
      ) as bool);

  @override
  bool get isNotEmpty => (super.noSuchMethod(
        Invocation.getter(#isNotEmpty),
        returnValue: false,
      ) as bool);

  @override
  Iterable<E> valuesBetween({
    dynamic startKey,
    dynamic endKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #valuesBetween,
          [],
          {
            #startKey: startKey,
            #endKey: endKey,
          },
        ),
        returnValue: <E>[],
      ) as Iterable<E>);

  @override
  E? getAt(int? index) => (super.noSuchMethod(Invocation.method(
        #getAt,
        [index],
      )) as E?);

  @override
  Map<dynamic, E> toMap() => (super.noSuchMethod(
        Invocation.method(
          #toMap,
          [],
        ),
        returnValue: <dynamic, E>{},
      ) as Map<dynamic, E>);

  @override
  dynamic keyAt(int? index) => super.noSuchMethod(Invocation.method(
        #keyAt,
        [index],
      ));

  @override
  _i5.Stream<_i7.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
          {#key: key},
        ),
        returnValue: _i5.Stream<_i7.BoxEvent>.empty(),
      ) as _i5.Stream<_i7.BoxEvent>);

  @override
  bool containsKey(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i5.Future<void> put(
    dynamic key,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> putAt(
    int? index,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAt,
          [
            index,
            value,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> putAll(Map<dynamic, E>? entries) => (super.noSuchMethod(
        Invocation.method(
          #putAll,
          [entries],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<int> add(E? value) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [value],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<Iterable<int>> addAll(Iterable<E>? values) => (super.noSuchMethod(
        Invocation.method(
          #addAll,
          [values],
        ),
        returnValue: _i5.Future<Iterable<int>>.value(<int>[]),
      ) as _i5.Future<Iterable<int>>);

  @override
  _i5.Future<void> delete(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #deleteAt,
          [index],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteAll(Iterable<dynamic>? keys) => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [keys],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> compact() => (super.noSuchMethod(
        Invocation.method(
          #compact,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<int> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
