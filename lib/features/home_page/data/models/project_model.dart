import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String name,
    @JsonKey(name: 'comment_count') required int commentCount,
    required String color,
    @JsonKey(name: 'is_shared') required bool isShared,
    required int order,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'is_inbox_project') required bool isInboxProject,
    @JsonKey(name: 'is_team_inbox') required bool isTeamInbox,
    @JsonKey(name: 'view_style') required String viewStyle,
    required String url,
    @JsonKey(name: 'parent_id') int? parentId,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
}
