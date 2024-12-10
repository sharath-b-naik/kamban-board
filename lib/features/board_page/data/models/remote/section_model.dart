import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/section.dart';

part 'section_model.freezed.dart';
part 'section_model.g.dart';

@freezed
class SectionModel with _$SectionModel {
  const factory SectionModel({
    String? id,
    @JsonKey(name: 'project_id') String? projectID,
    int? order,
    String? name,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, dynamic> json) => _$SectionModelFromJson(json);
}

extension SectionModelX on SectionModel {
  Section toDomain() {
    return Section(
      id: id!,
      name: name!,
      order: order!,
      projectID: projectID!,
      sectionType: order!.getTypeBasedOnSectionOrder(),
    );
  }
}
