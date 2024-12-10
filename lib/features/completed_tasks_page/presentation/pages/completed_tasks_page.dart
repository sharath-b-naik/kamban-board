import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamban/core/translations/translations.dart';

import '../cubits/completed_tasks_cubit.dart';

class CompletedTasksPage extends StatelessWidget {
  static String route() => '/completed-tasks';

  const CompletedTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(AppLocalizations.completedTasks))),
      body: BlocProvider(
        create: (context) => CompletedTasksCubit()..loadCompletedTasks(),
        child: BlocBuilder<CompletedTasksCubit, CompletedTasksState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text(context.tr(AppLocalizations.noCompletedTasks))),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (tasks) => ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task.content),
                    subtitle: Text(
                      '${context.tr(AppLocalizations.completedAt)}: ${(task.timeSpent / 60).toStringAsFixed(2)} min',
                    ),
                  );
                },
              ),
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
