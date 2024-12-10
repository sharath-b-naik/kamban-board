import 'package:freezed_annotation/freezed_annotation.dart';

import 'section.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String content,
    required DateTime createdAt,
    required String sectionId,
    @Default([]) List<Comment> comments,
    @Default(SectionType.toDo) SectionType sectionType,
    @Default(0) int timeSpent, // Time spent in seconds
    @Default(false) bool isTiming, // Timer status
  }) = _Task;
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String content,
  }) = _Comment;
}
