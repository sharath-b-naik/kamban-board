import 'package:go_router/go_router.dart';
import 'package:kamban/features/completed_tasks_page/presentation/pages/completed_tasks_page.dart';
import 'package:kamban/features/home_page/presentation/pages/home_page.dart';

import '../../features/board_page/presentation/pages/board_page.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: HomePage.route,
  routes: [
    GoRoute(
      name: HomePage.route,
      path: HomePage.route,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: BoardPage.route(),
      path: BoardPage.route(),
      builder: (context, state) => BoardPage(
        projectID: state.pathParameters['id'] as String,
      ),
    ),
    GoRoute(
      name: CompletedTasksPage.route(),
      path: CompletedTasksPage.route(),
      builder: (context, state) => const CompletedTasksPage(),
    ),
  ],
);
