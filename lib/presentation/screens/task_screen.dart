import 'package:flutter/material.dart';
import 'package:todo_app/presentation/widgets/user_info.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [const SliverToBoxAdapter(child: UserInfo())],
        ),
      ),
    );
  }
}
