import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class CategoryListTitle extends StatelessWidget {
  const CategoryListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(showUpdateSnackBar());
              // add new
            },
            child: const Text(
              'اضافه کردن',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: greennColor,
              ),
            ),
          ),
          const Text(
            'دسته بندی',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

SnackBar showUpdateSnackBar() => SnackBar(
  content: Row(
    children: [
      SizedBox(height: 18, width: 18, child: Image.asset('images/heart.png')),
      const SizedBox(width: 2),
      const Text(
        'این بخش در آپدیت بعدی اضافه میشه',
        style: TextStyle(color: whiteColor),
      ),
    ],
  ),
  backgroundColor: Colors.black54,
);
