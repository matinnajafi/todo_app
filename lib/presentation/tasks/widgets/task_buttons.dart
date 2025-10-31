import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/routing/app_route.dart';
import 'package:todo_app/data/models/task_type_enum.dart';
import 'package:todo_app/data/services/task_services.dart';

class AddTaskButton extends StatelessWidget {
  AddTaskButton({
    super.key,
    required this.taskTitleController,
    required this.taskSubTitleController,
  });

  final TextEditingController taskTitleController;
  final TextEditingController taskSubTitleController;

  final TaskService _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final title = taskTitleController.text.trim();
        final subtitle = taskSubTitleController.text.trim();

        if (title.isEmpty || subtitle.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('عنوان و توضیحات نباید خالی باشند')),
          );
          return;
        }

        _taskService.addTask(
          title: title,
          subtitle: subtitle,
          type: TaskTypeEnum.work, // You can make this dynamic later
        );

        context.goNamed(AppRoute.task.name);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 48),
        backgroundColor: const Color(0xff18DAA3),
      ),
      child: const Text(
        'اضافه کردن تسک',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class EditTaskButton extends StatelessWidget {
  const EditTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // edit task process
        // Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 48),
        backgroundColor: const Color(0xff18DAA3),
      ),
      child: const Text(
        'ویرایش کردن تسک',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
