import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kamban/features/board_page/domain/entities/task.dart';

import '../../../domain/entities/section.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String content,
    @Default('') String description,
    @JsonKey(name: 'comment_count') @Default(0) int commentCount,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
    @Default(0) int order,
    @Default(1) int priority,
    @JsonKey(name: 'project_id') required String projectId,
    @Default([]) List<String> labels,
    DateTime? due,
    @JsonKey(name: 'section_id') String? sectionId,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'creator_id') required String creatorId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'assignee_id') String? assigneeId,
    @JsonKey(name: 'assigner_id') String? assignerId,
    required String url,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}

extension TaskModelX on TaskModel {
  Task toDomain() {
    return Task(
      id: id,
      content: content,
      createdAt: createdAt,
      comments: [],
      sectionType: isCompleted ? SectionType.done : SectionType.toDo,
      sectionId: sectionId!,
    );
  }
}
