import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/utils/converters/persian_number_converter.dart';

class TimePickerBox extends StatelessWidget {
  const TimePickerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            showPicker(
              context: context,
              value: Time(hour: 22, minute: 30),
              onChange: (TimeOfDay time) {},
              onChangeDateTime: (DateTime dateTime) {},
              is24HrFormat: true,
              iosStylePicker: true,
            ),
          );
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'ب.ظ',
                  style: TextStyle(fontSize: 12, color: whiteColor),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    toPersianDigits('22:30'),
                    style: const TextStyle(fontSize: 16, color: whiteColor),
                  ),
                ),
                const Spacer(),
                const Text(
                  'انتخاب زمان',
                  style: TextStyle(fontSize: 16, color: whiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14, left: 6),
                  child: Image.asset('images/clock.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
