import 'package:freezed_annotation/freezed_annotation.dart';

import 'task.dart';

part 'section.freezed.dart';

enum SectionType { toDo, inProgress, done }

extension SectionTypeExt on int {
  SectionType getTypeBasedOnSectionOrder() {
    if (this == 3) return SectionType.done;
    if (this == 2) return SectionType.inProgress;
    return SectionType.toDo;
  }
}

@freezed
class Section with _$Section {
  const factory Section({
    required String id,
    @JsonKey(name: 'project_id') required String projectID,
    required int order,
    required String name,
    @Default([]) List<Task> tasks,
    @Default(SectionType.toDo) SectionType sectionType,
  }) = _Section;
}
