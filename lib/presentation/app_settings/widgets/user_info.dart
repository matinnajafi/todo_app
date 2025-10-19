import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class UserInfoBox extends StatelessWidget {
  const UserInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            width: 64,
            height: 64,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [blueColor, Color.fromARGB(255, 206, 220, 255)],
              ),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('images/man_icon.png'),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'متین نجفی',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
          ),
          const Text(
            'matin7najafi@gmail.com',
            style: TextStyle(fontSize: 12, color: greytextColor),
          ),
        ],
      ),
    );
  }
}
