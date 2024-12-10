// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      commentCount: (json['comment_count'] as num).toInt(),
      color: json['color'] as String,
      isShared: json['is_shared'] as bool,
      order: (json['order'] as num).toInt(),
      isFavorite: json['is_favorite'] as bool,
      isInboxProject: json['is_inbox_project'] as bool,
      isTeamInbox: json['is_team_inbox'] as bool,
      viewStyle: json['view_style'] as String,
      url: json['url'] as String,
      parentId: (json['parent_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comment_count': instance.commentCount,
      'color': instance.color,
      'is_shared': instance.isShared,
      'order': instance.order,
      'is_favorite': instance.isFavorite,
      'is_inbox_project': instance.isInboxProject,
      'is_team_inbox': instance.isTeamInbox,
      'view_style': instance.viewStyle,
      'url': instance.url,
      'parent_id': instance.parentId,
    };
