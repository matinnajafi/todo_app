import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

InputDecoration buildInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: greyyColor),
    contentPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide(color: Color(0xffC5C5C5), width: 2.5),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      borderSide: BorderSide(width: 3, color: Color(0xff18DAA3)),
    ),
  );
}

class FirstnameField extends StatelessWidget {
  const FirstnameField({super.key, required this.controllerFirstName});

  final TextEditingController controllerFirstName;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controllerFirstName,
        decoration: buildInputDecoration('نام'),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'وارد کردن نام الزامی است';
          }
          return null;
        },
      ),
    );
  }
}

class LastnameField extends StatelessWidget {
  const LastnameField({super.key, required this.controllerLastName});

  final TextEditingController controllerLastName;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controllerLastName,
        decoration: buildInputDecoration('نام خانوادگی'),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'وارد کردن نام خانوادگی الزامی است';
          }
          return null;
        },
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controllerUserEmail});

  final TextEditingController controllerUserEmail;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controllerUserEmail,
        decoration: buildInputDecoration('ایمیل (اختیاری)'),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value != null && value.isNotEmpty && !value.contains('@')) {
            return 'فرمت ایمیل معتبر نیست';
          }
          return null;
        },
      ),
    );
  }
}

class LoginTitle extends StatelessWidget {
  final Size size;
  const LoginTitle({super.key, this.size = const Size(0, 0)});

  @override
  Widget build(BuildContext context) {
    final double fontScale = size.height < 640 ? 0.9 : 1.0;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'ثبت نام/ ورود',
          style: TextStyle(
            fontSize: 26 * fontScale,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
