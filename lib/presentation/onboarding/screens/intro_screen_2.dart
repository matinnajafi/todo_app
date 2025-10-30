import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTallScreen = constraints.maxHeight > 800;
            final imageMaxWidth = constraints.maxWidth < 440 ? 400.0 : 440.0;
            final double fontScale = constraints.maxWidth < 360 ? 0.85 : 1.0;

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.blue[100],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: isTallScreen ? 50 : 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _IntroImage(imageMaxWidth, isTallScreen),
                        const SizedBox(height: 18),
                        _TitleText(fontScale),
                        const SizedBox(height: 18),
                        _DescriptionText(fontScale),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _IntroImage extends StatelessWidget {
  final double maxWidth;
  final bool isTallScreen;
  const _IntroImage(this.maxWidth, this.isTallScreen);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isTallScreen ? maxWidth : maxWidth - 40,
      child: Center(
        child: Image.asset('images/intro2.png', fit: BoxFit.contain),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final double scale;
  const _TitleText(this.scale);

  @override
  Widget build(BuildContext context) {
    return Text(
      'تسک خودتو بساز',
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: blackColor,
        fontSize: 24 * scale,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final double scale;
  const _DescriptionText(this.scale);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'کافیه دایره سبز رنگ پایین صفحه رو بزنی و یادداشت جدید بسازی، فراموش کاری؟؟ خب هشدار رو برای کارای مهمت روشن بزار تا بهت خبر بده',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: greytextColor,
          fontSize: 14 * scale,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
