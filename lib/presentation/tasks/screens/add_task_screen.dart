import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/presentation/tasks/widgets/task_alarm.dart';
import 'package:todo_app/presentation/tasks/widgets/task_buttons.dart';
import 'package:todo_app/presentation/tasks/widgets/task_textfields.dart';
import 'package:todo_app/presentation/tasks/widgets/task_type_list.dart';
import 'package:todo_app/presentation/tasks/widgets/time_picker.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode taskTitleFocus = FocusNode();
  FocusNode taskSubtitleFocus = FocusNode();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskSubTitleController = TextEditingController();

  bool isNotifOn = false;
  int selectedTaskTypeItem = 0;

  @override
  void initState() {
    super.initState();
    taskTitleFocus.addListener(() {
      setState(() {});
    });
    taskSubtitleFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    taskTitleFocus.dispose();
    taskSubtitleFocus.dispose();
    taskTitleController.dispose();
    taskSubTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 44),
                TaskTitleField(
                  taskTitleController: taskTitleController,
                  taskTitleFocus: taskTitleFocus,
                ),
                const SizedBox(height: 14),
                TaskSubtitleField(
                  taskSubTitleController: taskSubTitleController,
                  taskSubtitleFocus: taskSubtitleFocus,
                ),
                const SizedBox(height: 34),
                const TimePickerBox(),
                const SizedBox(height: 12),
                TaskAlarm(isNotifOn: isNotifOn),
                const Spacer(),
                const TaskTypeTitle(),
                const SizedBox(height: 6),
                TaskTypeList(selectedItemList: selectedTaskTypeItem),
                const Spacer(),
                const AddTaskButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
