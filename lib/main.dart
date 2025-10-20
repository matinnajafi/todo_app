import 'package:flutter/material.dart';
import 'package:todo_app/presentation/tasks/screens/add_task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sh'),
      home: const AddTaskScreen(),
    );
  }
}
