import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/utils/converters/persian_number_converter.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.35,
            motion: const StretchMotion(),
            children: [
              CustomSlidableAction(
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                onPressed: (context) {
                  // delete task
                },
                child: SizedBox(
                  height: 34,
                  width: 34,
                  child: Image.asset('images/delete.png'),
                ),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 24, left: 24, bottom: 1),
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 24,
                  offset: Offset(0, 12),
                  spreadRadius: -36,
                  color: Colors.black,
                ),
              ],
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: getMainContent(),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.25,
                    child: Checkbox(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 161, 160, 160),
                        width: 1.4,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      value: true,
                      onChanged: (isChecked) {
                        setState(() {
                          // do something
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'تایتل تسک',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'توضیحات تسک',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Spacer(),
              getTimeAndEditBadges(),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Image.asset('images/work_man.png'),
      ],
    );
  }

  Widget getTimeAndEditBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 80,
          height: 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgreenColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(top: 4, right: 6),
                child: Text(
                  toPersianDigits('22:20'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: darkColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: greennColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset('images/timer.png'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: () {},
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightgreenColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('images/editt.png'),
            ),
          ),
        ),
      ],
    );
  }
}
