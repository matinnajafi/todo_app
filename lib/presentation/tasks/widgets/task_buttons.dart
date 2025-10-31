import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/routing/app_route.dart';
import 'package:todo_app/presentation/tasks/bloc/task_bloc.dart';
import 'package:todo_app/presentation/tasks/bloc/task_event.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.taskTitleController,
    required this.taskSubTitleController,
  });

  final TextEditingController taskTitleController;
  final TextEditingController taskSubTitleController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final title = taskTitleController.text.trim();
        final subtitle = taskSubTitleController.text.trim();

        // validate input
        if (title.isEmpty || subtitle.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('عنوان و توضیحات نباید خالی باشند')),
          );
          return;
        }

        // add task process
        context.read<TaskBloc>().add(AddTaskEvent(title, subtitle));

        // Clear the text fields after adding the task
        taskTitleController.clear();
        taskSubTitleController.clear();

        // Navigate back to the task list screen
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
