import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class TaskTypeList extends StatefulWidget {
  TaskTypeList({super.key, required this.selectedItemList});
  int selectedItemList = 0;

  @override
  State<TaskTypeList> createState() => _TaskTypeListState();
}

class _TaskTypeListState extends State<TaskTypeList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(right: 34),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: const Color.fromARGB(54, 196, 255, 234),
                onTap: () {
                  setState(() {
                    widget.selectedItemList = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        (widget.selectedItemList == index)
                            ? greennColor
                            : whiteColor,
                    border: Border.all(
                      color:
                          (widget.selectedItemList == index)
                              ? greennColor
                              : Colors.grey.shade400,
                      width: 1.8,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          right: 4,
                          left: 4,
                        ),
                        child: Image.asset('images/workout_man.png'),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'ورزش',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              (widget.selectedItemList == index)
                                  ? Colors.black87
                                  : const Color.fromARGB(255, 167, 165, 165),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TaskTypeTitle extends StatelessWidget {
  const TaskTypeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 44),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            ':انتخاب نوع تسک',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
