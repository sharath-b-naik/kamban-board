import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kamban/features/board_page/domain/entities/task.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String content,
    String? id,
    @JsonKey(name: 'task_id') required String taskId,
    @JsonKey(name: 'posted_at') required String? postedAt,
    @JsonKey(name: 'project_id') String? projectId,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}

extension CommentModelX on CommentModel {
  Comment toDomain() {
    return Comment(
      content: content,
    );
  }
}
