import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kamban/core/translations/translations.dart';
import 'package:kamban/features/home_page/presentation/pages/widgets/settings_sheet.dart';
import 'package:size_config/size_config.dart';

import '../../../board_page/presentation/pages/board_page.dart';
import '../../data/models/project_model.dart';
import '../cubits/project_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr(AppLocalizations.home),
        ),
        actions: [
          IconButton(
            onPressed: () => showSettingsSheet(context),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: BlocBuilder<ProjectsCubit, ProjectsState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text(context.tr(AppLocalizations.noTasksLoaded))),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (projects) {
              return ListView.builder(
                itemCount: projects.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return BoardRow(project: projects[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class BoardRow extends StatelessWidget {
  const BoardRow({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed(
            BoardPage.route(),
            pathParameters: {'id': project.id},
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              project.name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
