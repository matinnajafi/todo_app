import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/presentation/app_settings/widgets/app_version.dart';
import 'package:todo_app/presentation/app_settings/widgets/setting_tiles.dart';
import 'package:todo_app/presentation/app_settings/widgets/user_info.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 34),
                const UserInfoBox(),
                const SizedBox(height: 44),
                SettingTile(
                  title: 'ویرایش مشخصات',
                  icon: Image.asset('images/person.png'),
                  badge: Image.asset('images/edit_black.png'),
                  badgePadding: const EdgeInsets.only(left: 16),
                  badgeHeight: 18,
                  badgeWidth: 18,
                  onTap: () {},
                ),
                SettingTile(
                  title: 'دارک مود',
                  icon: Image.asset('images/sun.png'),
                  badge: Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Transform.scale(
                      scale: 0.9, // Adjust this value to shrink or enlarge
                      child: CupertinoSwitch(
                        thumbColor: whiteColor,
                        activeTrackColor: greennColor,
                        value: false,
                        onChanged: (bool value) {},
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                SettingTile(
                  title: 'گزارش باگ',
                  icon: Image.asset('images/bug.png'),
                  onTap: () {},
                ),
                SettingTile(
                  title: 'تماس با ما',
                  icon: Image.asset('images/at.png'),
                  onTap: () {},
                ),
                SettingTile(
                  title: 'امتیاز به برنامه',
                  icon: Image.asset('images/half_star.png'),

                  onTap: () {},
                ),
                SettingTile(
                  title: 'سایر برنامه‌ها',
                  icon: Image.asset('images/apps.png'),
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                const AppVersion(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
