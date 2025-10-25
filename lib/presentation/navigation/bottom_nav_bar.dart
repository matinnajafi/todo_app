import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/routing/app_route.dart';

class BottomNavigationShell extends StatelessWidget {
  final Widget child;
  final String location;

  const BottomNavigationShell({
    super.key,
    required this.child,
    required this.location,
  });

  int _calculateSelectedIndex(String location) {
    if (location.startsWith(AppRoute.setting.path)) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(location);

    return Scaffold(
      floatingActionButton: const GetFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        height: 72,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: navigationBottomColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 46.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                context,
                selectedIndex,
                0,
                AppRoute.task,
                'date_white.png',
                'date_grey.png',
              ),
              const Spacer(),
              _buildNavItem(
                context,
                selectedIndex,
                1,
                AppRoute.setting,
                'setting_white.png',
                'setting_grey.png',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(child: child),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int selectedIndex,
    int index,
    AppRoute route,
    String imageSelect,
    String imageUnselect,
  ) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        context.goNamed(route.name);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white24 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: isSelected ? 28 : 26,
          width: isSelected ? 28 : 26,
          child: Image.asset(
            'images/${isSelected ? imageSelect : imageUnselect}',
          ),
        ),
      ),
    );
  }
}

class GetFAB extends StatelessWidget {
  const GetFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 4,
      backgroundColor: navigationBottomColor,
      onPressed: () => context.goNamed(AppRoute.addTask.name),
      shape: const CircleBorder(),
      child: Image.asset('images/icon_add.png'),
    );
  }
}
