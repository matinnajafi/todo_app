import 'dart:ui';

import 'package:todo_app/core/constants/app_colors.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  String get labelFa {
    switch (this) {
      case Gender.male:
        return 'آقا';
      case Gender.female:
        return 'خانم';
    }
  }

  String get iconPath {
    switch (this) {
      case Gender.male:
        return 'images/man_icon.png';
      case Gender.female:
        return 'images/woman_icon.png';
    }
  }

  Color get activeColor {
    switch (this) {
      case Gender.male:
        return blueColor;
      case Gender.female:
        return pinkColor;
    }
  }
}
