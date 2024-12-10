// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      projectId: json['project_id'] as String,
      sectionId: json['section_id'] as String,
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'project_id': instance.projectId,
      'section_id': instance.sectionId,
      'priority': instance.priority,
    };
