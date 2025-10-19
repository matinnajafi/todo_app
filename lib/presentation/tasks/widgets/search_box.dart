import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        height: 46,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              spreadRadius: -20,
              blurRadius: 20,
              offset: Offset(0, 4),
              color: greytextColor,
            ),
          ],
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25,
                height: 25,
                child: Image.asset('images/search_icon.png'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    // Search Task
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'جستجوی تسک ...',
                    hintStyle: TextStyle(
                      fontFamily: 'sh',
                      color: greyyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                child: Image.asset('images/filter_icon.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
