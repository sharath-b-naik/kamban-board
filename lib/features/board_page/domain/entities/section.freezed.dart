// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Section {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  String get projectID => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;
  SectionType get sectionType => throw _privateConstructorUsedError;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionCopyWith<Section> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionCopyWith<$Res> {
  factory $SectionCopyWith(Section value, $Res Function(Section) then) =
      _$SectionCopyWithImpl<$Res, Section>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'project_id') String projectID,
      int order,
      String name,
      List<Task> tasks,
      SectionType sectionType});
}

/// @nodoc
class _$SectionCopyWithImpl<$Res, $Val extends Section>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectID = null,
    Object? order = null,
    Object? name = null,
    Object? tasks = null,
    Object? sectionType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectID: null == projectID
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      sectionType: null == sectionType
          ? _value.sectionType
          : sectionType // ignore: cast_nullable_to_non_nullable
              as SectionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SectionImplCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$$SectionImplCopyWith(
          _$SectionImpl value, $Res Function(_$SectionImpl) then) =
      __$$SectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'project_id') String projectID,
      int order,
      String name,
      List<Task> tasks,
      SectionType sectionType});
}

/// @nodoc
class __$$SectionImplCopyWithImpl<$Res>
    extends _$SectionCopyWithImpl<$Res, _$SectionImpl>
    implements _$$SectionImplCopyWith<$Res> {
  __$$SectionImplCopyWithImpl(
      _$SectionImpl _value, $Res Function(_$SectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectID = null,
    Object? order = null,
    Object? name = null,
    Object? tasks = null,
    Object? sectionType = null,
  }) {
    return _then(_$SectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectID: null == projectID
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      sectionType: null == sectionType
          ? _value.sectionType
          : sectionType // ignore: cast_nullable_to_non_nullable
              as SectionType,
    ));
  }
}

/// @nodoc

class _$SectionImpl implements _Section {
  const _$SectionImpl(
      {required this.id,
      @JsonKey(name: 'project_id') required this.projectID,
      required this.order,
      required this.name,
      final List<Task> tasks = const [],
      this.sectionType = SectionType.toDo})
      : _tasks = tasks;

  @override
  final String id;
  @override
  @JsonKey(name: 'project_id')
  final String projectID;
  @override
  final int order;
  @override
  final String name;
  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final SectionType sectionType;

  @override
  String toString() {
    return 'Section(id: $id, projectID: $projectID, order: $order, name: $name, tasks: $tasks, sectionType: $sectionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectID, projectID) ||
                other.projectID == projectID) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.sectionType, sectionType) ||
                other.sectionType == sectionType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, projectID, order, name,
      const DeepCollectionEquality().hash(_tasks), sectionType);

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      __$$SectionImplCopyWithImpl<_$SectionImpl>(this, _$identity);
}

abstract class _Section implements Section {
  const factory _Section(
      {required final String id,
      @JsonKey(name: 'project_id') required final String projectID,
      required final int order,
      required final String name,
      final List<Task> tasks,
      final SectionType sectionType}) = _$SectionImpl;

  @override
  String get id;
  @override
  @JsonKey(name: 'project_id')
  String get projectID;
  @override
  int get order;
  @override
  String get name;
  @override
  List<Task> get tasks;
  @override
  SectionType get sectionType;

  /// Create a copy of Section
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
