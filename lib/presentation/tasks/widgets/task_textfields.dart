import 'package:flutter/material.dart';

class TaskTitleField extends StatelessWidget {
  const TaskTitleField({
    super.key,
    required this.taskTitleController,
    required this.taskTitleFocus,
  });

  final TextEditingController taskTitleController;
  final FocusNode taskTitleFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: taskTitleController,
          focusNode: taskTitleFocus,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            labelText: 'عنوان تسک',
            labelStyle: TextStyle(
              fontSize: 20,
              color:
                  taskTitleFocus.hasFocus
                      ? const Color(0xff18DAA3)
                      : const Color(0xffC5C5C5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Color(0xffC5C5C5), width: 2.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xff18DAA3)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً عنوان تسک را وارد کنید';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class TaskSubtitleField extends StatelessWidget {
  const TaskSubtitleField({
    super.key,
    required this.taskSubTitleController,
    required this.taskSubtitleFocus,
  });

  final TextEditingController taskSubTitleController;
  final FocusNode taskSubtitleFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: taskSubTitleController,
          maxLines: 3,
          focusNode: taskSubtitleFocus,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            labelText: 'توضیحات تسک',
            labelStyle: TextStyle(
              fontSize: 20,
              color:
                  taskSubtitleFocus.hasFocus
                      ? const Color(0xff18DAA3)
                      : const Color(0xffC5C5C5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Color(0xffC5C5C5), width: 2.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 3, color: Color(0xff18DAA3)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً توضیحات تسک را وارد کنید';
            }
            return null;
          },
        ),
      ),
    );
  }
}
