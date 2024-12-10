import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kamban/core/translations/translations.dart';
import 'package:kamban/widgets/app_buttons.dart';
import 'package:size_config/size_config.dart';

import '../../../../../widgets/text_field.dart';
import '../../cubits/tasks_cubit.dart';

void showAddTaskModalSheet(BuildContext parentContext) {
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
        value: BlocProvider.of<TasksCubit>(parentContext),
        child: const CreateListModalBottomSheet(),
      );
    },
  );
}

class CreateListModalBottomSheet extends StatefulWidget {
  const CreateListModalBottomSheet({super.key});

  @override
  State<CreateListModalBottomSheet> createState() => _CreateListModalBottomSheetState();
}

class _CreateListModalBottomSheetState extends State<CreateListModalBottomSheet> {
  final TextEditingController _addTaskController = TextEditingController();

  void _onAddTaskClick() {
    final content = _addTaskController.text.trim();
    if (content.isEmpty) return;
    context.read<TasksCubit>().addTask(content);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _addTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    GeneralTextField(
                      maxLength: 200,
                      hintText: context.tr(AppLocalizations.enterTaskContent),
                      maxLine: 10,
                      minLine: 10,
                      textController: _addTaskController,
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 2).w, right: 16.w),
                      child: AppButton(
                        onTap: _onAddTaskClick,
                        textButton: context.tr(AppLocalizations.update),
                        isEnable: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
