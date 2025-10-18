import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/presentation/widgets/category_list.dart';
import 'package:todo_app/presentation/widgets/category_list_title.dart';
import 'package:todo_app/presentation/widgets/search_box.dart';
import 'package:todo_app/presentation/widgets/user_info.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: const [
            SliverToBoxAdapter(child: UserInfo()),
            SliverPadding(padding: EdgeInsets.only(bottom: 26)),
            SliverToBoxAdapter(child: SearchBox()),
            SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            SliverToBoxAdapter(child: CategoryListTitle()),
            SliverPadding(padding: EdgeInsets.only(bottom: 12)),
            SliverToBoxAdapter(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
