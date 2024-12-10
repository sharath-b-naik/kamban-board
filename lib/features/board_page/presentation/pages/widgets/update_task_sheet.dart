import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kamban/core/translations/translations.dart';
import 'package:kamban/features/board_page/domain/entities/task.dart';
import 'package:kamban/widgets/app_buttons.dart';
import 'package:size_config/size_config.dart';

import '../../../../../widgets/text_field.dart';
import '../../cubits/tasks_cubit.dart';

void showUpdateTaskModalSheet(BuildContext parentContext, Task task) {
  showModalBottomSheet(
    context: parentContext,
    isScrollControlled: true,
    elevation: 16,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    backgroundColor: Theme.of(parentContext).colorScheme.surface,
    isDismissible: true,
    builder: (_) {
      return BlocProvider.value(
        value: BlocProvider.of<TasksCubit>(parentContext)..loadComments(task.id),
        child: CreateListModalBottomSheet(task: task),
      );
    },
  );
}

class CreateListModalBottomSheet extends StatefulWidget {
  const CreateListModalBottomSheet({super.key, required this.task});
  final Task task;

  @override
  State<CreateListModalBottomSheet> createState() => _CreateListModalBottomSheetState();
}

class _CreateListModalBottomSheetState extends State<CreateListModalBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.content;
  }

  _onClick() {
    final content = _titleController.text.trim();

    if (content.isEmpty) return;
    final update = widget.task.copyWith(content: content);
    BlocProvider.of<TasksCubit>(context).updateTask(update);
    Navigator.pop(context);
  }

  _onCommentClick() {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) return;
    BlocProvider.of<TasksCubit>(context).addComment(widget.task.id, comment);
    _commentController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TaskCubitState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(child: Text(context.tr(AppLocalizations.noTasksLoaded))),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          loaded: (data) {
            // Find the updated task from the state
            final updatedTask = data.tasks.firstWhere((task) => task.id == widget.task.id, orElse: () => widget.task);

            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            context.tr(AppLocalizations.task),
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.cancel,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            GeneralTextField(
                              maxLength: 200,
                              hintText: context.tr(AppLocalizations.enterTaskContent),
                              maxLine: 10,
                              textController: _titleController,
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 2).w, right: 16.w),
                              child: AppButton(
                                onTap: _onClick,
                                textButton: context.tr(AppLocalizations.update),
                                isEnable: true,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                context.tr(AppLocalizations.comments),
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            if (updatedTask.comments.isEmpty) ...[
                              Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Text(
                                  'No comments',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ] else ...[
                              ...updatedTask.comments.map(
                                (comment) {
                                  return Row(
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(vertical: 5),
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(4),
                                            color: Theme.of(context).colorScheme.secondary,
                                          ),
                                          child: Text(
                                            comment.content,
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: GeneralTextField(
                            hintText: context.tr(AppLocalizations.typeComment),
                            maxLength: 200,
                            maxLine: 10,
                            textController: _commentController,
                          ),
                        ),
                        IconButton(
                          onPressed: _onCommentClick,
                          icon: const Icon(
                            Icons.send,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
