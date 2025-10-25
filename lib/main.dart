import 'package:flutter/material.dart';
import 'package:todo_app/core/routing/go_router.dart';

void main() {
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
