import 'package:go_router/go_router.dart';
import 'package:todo_app/core/routing/app_route.dart';
import 'package:todo_app/presentation/app_settings/screens/setting_screen.dart';
import 'package:todo_app/presentation/navigation/bottom_nav_bar.dart';
import 'package:todo_app/presentation/tasks/screens/add_task_screen.dart';
import 'package:todo_app/presentation/tasks/screens/edit_task_screen.dart';
import 'package:todo_app/presentation/tasks/screens/task_screen.dart';

final appGlobalRout = GoRouter(
  initialLocation: AppRoute.task.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavigationShell(
          location: state.uri.toString(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: AppRoute.task.path,
          name: AppRoute.task.name,
          builder: (context, state) => const TaskScreen(),
        ),
        GoRoute(
          path: AppRoute.setting.path,
          name: AppRoute.setting.name,
          builder: (context, state) => const SettingScreen(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.addTask.path,
      name: AppRoute.addTask.name,
      builder: (context, state) => const AddTaskScreen(),
    ),
    GoRoute(
      path: AppRoute.editTask.path,
      name: AppRoute.editTask.name,
      builder: (context, state) => const EditTaskScreen(),
    ),
  ],
);
