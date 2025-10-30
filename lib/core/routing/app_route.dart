enum AppRoute {
  task,
  setting,
  addTask,
  editTask,
  intro,
  register;

  // Extracts the enum name as a string (e.g., 'task')
  String get name => toString().split('.').last;

  // Centralized path mapping for each route
  static const Map<AppRoute, String> _paths = {
    AppRoute.task: '/task',
    AppRoute.setting: '/setting',
    AppRoute.addTask: '/addtask',
    AppRoute.editTask: '/edittask',
    AppRoute.intro: '/intro',
    AppRoute.register: '/register',
  };

  // Returns the path for the current route
  String get path => _paths[this]!;
}
