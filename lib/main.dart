import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/constants/hive_box_names.dart';
import 'package:todo_app/core/routing/go_router.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/models/task_type.dart';
import 'package:todo_app/data/models/task_type_enum.dart';

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

  runApp(const MyApp());
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
