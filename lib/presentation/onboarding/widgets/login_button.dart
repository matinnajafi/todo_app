import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/routing/app_route.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.controllerFirstName,
    required this.controllerLastName,
  });

  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color.fromARGB(255, 91, 187, 144),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      onPressed: () async {
        if (_isLoading) return;

        final firstName = widget.controllerFirstName.text.trim();
        final lastName = widget.controllerLastName.text.trim();

        debugPrint('First name: $firstName');
        debugPrint('Last name: $lastName');

        setState(() => _isLoading = true);

        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          context.goNamed(AppRoute.task.name);
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child:
            _isLoading
                ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: whiteColor,
                    strokeWidth: 2.5,
                  ),
                )
                : const Text(
                  'ثبت',
                  key: ValueKey('text'),
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
