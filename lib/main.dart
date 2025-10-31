import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/constants/hive_box_names.dart';
import 'package:todo_app/core/routing/go_router.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/models/task_type.dart';
import 'package:todo_app/data/models/task_type_enum.dart';
import 'package:todo_app/data/services/task_services.dart';
import 'package:todo_app/presentation/tasks/bloc/task_bloc.dart';
import 'package:todo_app/presentation/tasks/bloc/task_event.dart';

void main() async {
  // initialize hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // register adapters
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());

  // open boxes
  await Hive.openBox<Task>(taskBoxName);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TaskBloc(TaskService())..add(LoadTasksEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sh'),
      routerConfig: appGlobalRout,
    );
  }
}
