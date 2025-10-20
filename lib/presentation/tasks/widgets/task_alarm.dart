import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/utils/converters/persian_number_converter.dart';

// ignore: must_be_immutable
class TaskAlarm extends StatefulWidget {
  TaskAlarm({super.key, required this.isNotifOn});
  bool isNotifOn;

  @override
  State<TaskAlarm> createState() => _TaskAlarmState();
}

class _TaskAlarmState extends State<TaskAlarm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isNotifOn = !widget.isNotifOn;
            if (widget.isNotifOn) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black54,
                  content: Text(
                    ".هشدار برای ساعت ${toPersianDigits('22:30')} فعال شد",
                    style: const TextStyle(color: whiteColor),
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black54,
                  content: Text(
                    ".هشدار غیرفعال شد",
                    style: const TextStyle(color: whiteColor),
                  ),
                ),
              );
            }
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: widget.isNotifOn ? orangeColor : whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.8,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: CupertinoSwitch(
                      inactiveTrackColor: Colors.grey.shade300,
                      activeTrackColor: greennColor,
                      value: widget.isNotifOn,
                      onChanged: (bool value) {
                        setState(() {
                          widget.isNotifOn = value;
                          if (widget.isNotifOn) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black54,
                                content: Text(
                                  ".هشدار برای ساعت ${toPersianDigits('22:30')} فعال شد",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black54,
                                content: const Text(
                                  ".هشدار غیرفعال شد",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'هشدار',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.isNotifOn ? whiteColor : greyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
