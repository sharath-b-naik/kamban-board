// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_shared')
  bool get isShared => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_inbox_project')
  bool get isInboxProject => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_team_inbox')
  bool get isTeamInbox => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_style')
  String get viewStyle => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'comment_count') int commentCount,
      String color,
      @JsonKey(name: 'is_shared') bool isShared,
      int order,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'is_inbox_project') bool isInboxProject,
      @JsonKey(name: 'is_team_inbox') bool isTeamInbox,
      @JsonKey(name: 'view_style') String viewStyle,
      String url,
      @JsonKey(name: 'parent_id') int? parentId});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? commentCount = null,
    Object? color = null,
    Object? isShared = null,
    Object? order = null,
    Object? isFavorite = null,
    Object? isInboxProject = null,
    Object? isTeamInbox = null,
    Object? viewStyle = null,
    Object? url = null,
    Object? parentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isInboxProject: null == isInboxProject
          ? _value.isInboxProject
          : isInboxProject // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeamInbox: null == isTeamInbox
          ? _value.isTeamInbox
          : isTeamInbox // ignore: cast_nullable_to_non_nullable
              as bool,
      viewStyle: null == viewStyle
          ? _value.viewStyle
          : viewStyle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'comment_count') int commentCount,
      String color,
      @JsonKey(name: 'is_shared') bool isShared,
      int order,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'is_inbox_project') bool isInboxProject,
      @JsonKey(name: 'is_team_inbox') bool isTeamInbox,
      @JsonKey(name: 'view_style') String viewStyle,
      String url,
      @JsonKey(name: 'parent_id') int? parentId});
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? commentCount = null,
    Object? color = null,
    Object? isShared = null,
    Object? order = null,
    Object? isFavorite = null,
    Object? isInboxProject = null,
    Object? isTeamInbox = null,
    Object? viewStyle = null,
    Object? url = null,
    Object? parentId = freezed,
  }) {
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isInboxProject: null == isInboxProject
          ? _value.isInboxProject
          : isInboxProject // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeamInbox: null == isTeamInbox
          ? _value.isTeamInbox
          : isTeamInbox // ignore: cast_nullable_to_non_nullable
              as bool,
      viewStyle: null == viewStyle
          ? _value.viewStyle
          : viewStyle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelImpl implements _ProjectModel {
  const _$ProjectModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'comment_count') required this.commentCount,
      required this.color,
      @JsonKey(name: 'is_shared') required this.isShared,
      required this.order,
      @JsonKey(name: 'is_favorite') required this.isFavorite,
      @JsonKey(name: 'is_inbox_project') required this.isInboxProject,
      @JsonKey(name: 'is_team_inbox') required this.isTeamInbox,
      @JsonKey(name: 'view_style') required this.viewStyle,
      required this.url,
      @JsonKey(name: 'parent_id') this.parentId});

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  final String color;
  @override
  @JsonKey(name: 'is_shared')
  final bool isShared;
  @override
  final int order;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @override
  @JsonKey(name: 'is_inbox_project')
  final bool isInboxProject;
  @override
  @JsonKey(name: 'is_team_inbox')
  final bool isTeamInbox;
  @override
  @JsonKey(name: 'view_style')
  final String viewStyle;
  @override
  final String url;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;

  @override
  String toString() {
    return 'ProjectModel(id: $id, name: $name, commentCount: $commentCount, color: $color, isShared: $isShared, order: $order, isFavorite: $isFavorite, isInboxProject: $isInboxProject, isTeamInbox: $isTeamInbox, viewStyle: $viewStyle, url: $url, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isInboxProject, isInboxProject) ||
                other.isInboxProject == isInboxProject) &&
            (identical(other.isTeamInbox, isTeamInbox) ||
                other.isTeamInbox == isTeamInbox) &&
            (identical(other.viewStyle, viewStyle) ||
                other.viewStyle == viewStyle) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      commentCount,
      color,
      isShared,
      order,
      isFavorite,
      isInboxProject,
      isTeamInbox,
      viewStyle,
      url,
      parentId);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
      {required final String id,
      required final String name,
      @JsonKey(name: 'comment_count') required final int commentCount,
      required final String color,
      @JsonKey(name: 'is_shared') required final bool isShared,
      required final int order,
      @JsonKey(name: 'is_favorite') required final bool isFavorite,
      @JsonKey(name: 'is_inbox_project') required final bool isInboxProject,
      @JsonKey(name: 'is_team_inbox') required final bool isTeamInbox,
      @JsonKey(name: 'view_style') required final String viewStyle,
      required final String url,
      @JsonKey(name: 'parent_id') final int? parentId}) = _$ProjectModelImpl;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @override
  String get color;
  @override
  @JsonKey(name: 'is_shared')
  bool get isShared;
  @override
  int get order;
  @override
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;
  @override
  @JsonKey(name: 'is_inbox_project')
  bool get isInboxProject;
  @override
  @JsonKey(name: 'is_team_inbox')
  bool get isTeamInbox;
  @override
  @JsonKey(name: 'view_style')
  String get viewStyle;
  @override
  String get url;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
