import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // add task process
        // Navigator.of(context).pop();
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
