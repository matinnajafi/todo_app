import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/hive_box_names.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/models/task_type.dart';
import 'package:todo_app/data/models/task_type_enum.dart';
import 'package:todo_app/presentation/tasks/widgets/category_list.dart';
import 'package:todo_app/presentation/tasks/widgets/category_list_title.dart';
import 'package:todo_app/presentation/tasks/widgets/search_box.dart';
import 'package:todo_app/presentation/tasks/widgets/task_widget.dart';
import 'package:todo_app/presentation/tasks/widgets/user_info.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isDoneTasksExpanded = false;

  var taskbox = Hive.box<Task>(taskBoxName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                var task = taskbox.values.toList()[index];
                return TaskWidget(task: task);
              }, childCount: taskbox.values.length),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDoneTasksExpanded = !isDoneTasksExpanded;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 32,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedRotation(
                            turns:
                                isDoneTasksExpanded
                                    ? -0.5
                                    : 0.0, // 180° or default
                            duration: const Duration(milliseconds: 250),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset('images/black_arrow.png'),
                            ),
                          ),
                          const Text(
                            'تسک‌های انجام شده',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 21,
                            width: 21,
                            child:
                                isDoneTasksExpanded
                                    ? IconButton(
                                      padding: EdgeInsets.zero,
                                      iconSize: 21,
                                      onPressed: () {
                                        setState(() {
                                          isDoneTasksExpanded = false;
                                          // clear done task list
                                        });
                                      },
                                      icon: Image.asset(
                                        'images/black_clear.png',
                                      ),
                                    )
                                    : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isDoneTasksExpanded)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: IgnorePointer(
                          child: TaskWidget(
                            task: Task(
                              title: 'done task',
                              subtitle: 'this is done task',
                              time: DateTime.now(),
                              taskType: TaskType(
                                image: 'images/work_man.png',
                                title: 'work',
                                taskTypeEnum: TaskTypeEnum.work,
                              ),
                              isNotifOn: false,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1),
                    ],
                  ),
                  childCount: 2,
                ),
              ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
          ],
        ),
      ),
    );
  }
}
