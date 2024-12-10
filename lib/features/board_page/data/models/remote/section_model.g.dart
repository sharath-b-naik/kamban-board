// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionModelImpl _$$SectionModelImplFromJson(Map<String, dynamic> json) =>
    _$SectionModelImpl(
      id: json['id'] as String?,
      projectID: json['project_id'] as String?,
      order: (json['order'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$SectionModelImplToJson(_$SectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectID,
      'order': instance.order,
      'name': instance.name,
    };
