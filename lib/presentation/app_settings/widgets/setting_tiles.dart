import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.badge,
    this.badgeHeight = 22.0,
    this.badgeWidth = 22.0,
    this.badgePadding = const EdgeInsets.only(left: 10.0),
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  final Widget? badge;
  final double badgeHeight;
  final double badgeWidth;
  final EdgeInsets badgePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.0),
      child: Material(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          splashColor: lightgreenColor,
          onTap: onTap,
          child: ListTile(
            contentPadding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
            leading: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SizedBox(height: 18, width: 18, child: icon),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Padding(
              padding: badgePadding,
              child: SizedBox(
                height: badgeHeight,
                width: badgeWidth,
                child: badge ?? Image.asset('images/black_arrow_left.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
