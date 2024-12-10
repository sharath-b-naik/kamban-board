import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  static setLocale(BuildContext context, [Locale? locale]) {
    context.setLocale(locale ?? context.locale);
  }

  static List<Locale> get supportedLocales => [
        const Locale('en', 'US'),
        const Locale('hi', 'IN'),
        const Locale('kn', 'IN'),
      ];

  static String get home => 'home';
  static String get task => 'task';
  static String get enterTaskContent => 'enter_task_content';
  static String get update => 'update';
  static String get noTasksLoaded => 'no_tasks_loaded';
  static String get comments => 'comments';
  static String get typeComment => 'type_comment';
  static String get kanbanBoard => 'kanban_board';
  static String get addTask => 'add_task';
  static String get completedTasks => 'completed_tasks';
  static String get completedAt => 'completed_at';
  static String get changeTheme => 'change_theme';
  static String get completedTasksPlural => 'completed_tasks'; // Updated key to reflect plural form
  static String get language => 'language';
  static String get noCompletedTasks => 'no_completed_tasks';
  static String get settings => 'settings';
}
