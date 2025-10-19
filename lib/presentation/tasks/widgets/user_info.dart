import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/utils/converters/persian_number_converter.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, right: 24, left: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            animation: true,
            animationDuration: 1000,
            radius: 27,
            lineWidth: 8,
            percent: 0.34,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              convertToPersianNumberWithPercent(
                0.34,
              ), // Displaying Persian number with percent sign
              style: const TextStyle(
                color: Color.fromARGB(255, 9, 184, 134),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            progressColor: greennColor,
            backgroundColor: lightgreenColor,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset('images/hand.png'),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    textAlign: TextAlign.center,
                    'متین',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: greennColor,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    ' ،سلام',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: darkColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const Text(
                '۴ تسک فعال در امروز',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: darkColor,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const UserIcon(),
        ],
      ),
    );
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: const ShapeDecoration(
        image: DecorationImage(image: AssetImage('images/user.png')),
        color: greennColor,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(48)),
          side: BorderSide.none,
        ),
      ),
    );
  }
}
