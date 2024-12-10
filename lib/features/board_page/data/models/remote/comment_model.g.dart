// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      content: json['content'] as String,
      id: json['id'] as String?,
      taskId: json['task_id'] as String,
      postedAt: json['posted_at'] as String?,
      projectId: json['project_id'] as String?,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'task_id': instance.taskId,
      'posted_at': instance.postedAt,
      'project_id': instance.projectId,
    };
