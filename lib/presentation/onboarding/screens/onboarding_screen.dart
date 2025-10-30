import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/routing/app_route.dart';
import 'package:todo_app/presentation/onboarding/screens/intro_screen_1.dart';
import 'package:todo_app/presentation/onboarding/screens/intro_screen_2.dart';
import 'package:todo_app/presentation/onboarding/screens/intro_screen_3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool _isPressed = false;

  static const double indicatorAlignmentY = 0.6;
  static const double buttonAlignmentY = 0.8;
  static const double skipAlignmentY = 0.9;
  static const int lastPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // PageView for intro screens
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = index == lastPageIndex;
              });
            },
            children: const [IntroScreen1(), IntroScreen2(), IntroScreen3()],
          ),

          // Smooth page indicator
          Align(
            alignment: Alignment(0, indicatorAlignmentY),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                spacing: 8.0,
                dotWidth: 20.0,
                dotHeight: 4.0,
                strokeWidth: 1.5,
                dotColor: Colors.grey.withOpacity(0.85),
                activeDotColor: blackColor,
                radius: 2.0,
                type: WormType.underground,
              ),
            ),
          ),

          // Navigation button
          Align(
            alignment: Alignment(0, buttonAlignmentY),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 260),
              curve: Curves.ease,
              height: _isPressed ? 45 : 50,
              width: size.width - 80,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                onPressed: () async {
                  setState(() => _isPressed = true);
                  await Future.delayed(const Duration(milliseconds: 100));
                  setState(() => _isPressed = false);

                  if (onLastPage) {
                    context.goNamed(AppRoute.register.name);
                  } else {
                    await _controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.decelerate,
                    );
                  }
                },
                child: Text(
                  onLastPage ? '!برو بریم' : 'بعدی',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: _isPressed ? 16 : 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Skip button
          Align(
            alignment: Alignment(0, skipAlignmentY),
            child:
                onLastPage
                    ? const SizedBox()
                    : GestureDetector(
                      onTap: () async {
                        await _controller.animateToPage(
                          lastPageIndex,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        );
                        context.goNamed(AppRoute.register.name);
                      },
                      child: const Text(
                        'رد کردن',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
