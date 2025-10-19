import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/presentation/widgets/category_list.dart';
import 'package:todo_app/presentation/widgets/category_list_title.dart';
import 'package:todo_app/presentation/widgets/search_box.dart';
import 'package:todo_app/presentation/widgets/task_widget.dart';
import 'package:todo_app/presentation/widgets/user_info.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: UserInfo()),
            const SliverPadding(padding: EdgeInsets.only(bottom: 26)),
            const SliverToBoxAdapter(child: SearchBox()),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            const SliverToBoxAdapter(child: CategoryListTitle()),
            const SliverPadding(padding: EdgeInsets.only(bottom: 12)),
            const SliverToBoxAdapter(child: CategoryList()),
            const SliverPadding(padding: EdgeInsets.only(bottom: 4)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const TaskWidget();
              }, childCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
