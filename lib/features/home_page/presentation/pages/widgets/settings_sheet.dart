import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kamban/core/translations/translations.dart';
import 'package:kamban/features/home_page/presentation/pages/widgets/change_language_dialog.dart';
import 'package:size_config/size_config.dart';

import '../../../../../core/themes/cubit/theme_cubit.dart';
import '../../../../completed_tasks_page/presentation/pages/completed_tasks_page.dart';

void showSettingsSheet(BuildContext parentContext) {
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
    isDismissible: true,
    builder: (_) {
      return const SettingsSheet();
    },
  );
}

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
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
                    context.tr(AppLocalizations.settings),
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
                    SettingTile(
                      title: context.tr(AppLocalizations.changeTheme),
                      trailing: Switch.adaptive(
                        value: context.watch<ThemeCubit>().isDarkTheme,
                        inactiveTrackColor: Colors.grey,
                        onChanged: (value) => context.read<ThemeCubit>().toggleTheme(),
                      ),
                      onTap: () => context.read<ThemeCubit>().toggleTheme(),
                    ),
                    const SizedBox(height: 10),
                    SettingTile(
                      title: context.tr(AppLocalizations.completedTasks),
                      trailing: const Icon(Icons.history),
                      onTap: () => context.pushNamed(CompletedTasksPage.route()),
                    ),
                    const SizedBox(height: 10),
                    SettingTile(
                      title: context.tr(AppLocalizations.language),
                      onTap: () => showLanguageChangeDialog(context),
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

class SettingTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;
  const SettingTile({
    super.key,
    required this.title,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 80),
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                if (trailing != null) trailing!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
