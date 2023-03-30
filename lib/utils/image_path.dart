import 'package:health_app/extensions/theme_value.dart';
import 'package:flutter/material.dart';

class ImagePathDark implements ImagePath {
  @override
  String get splashBoozin => "assets/splash_logo/dark/Booz_n.png";
  @override
  String get iconFootSteps => "assets/icons/dark/footsteps.png";
  @override
  String get iconKcal => "assets/icons/dark/kcal.png";
}

class ImagePathLight implements ImagePath {
  @override
  String get splashBoozin => "assets/splash_logo/light/Booz_n.png";
  @override
  String get iconFootSteps => "assets/icons/light/footsteps.png";
  @override
  String get iconKcal => "assets/icons/light/kcal.png";
}

class ImagePathCommon {
  static const String splashI = "assets/splash_logo/i_common.png";
}

abstract class ImagePath {
  String get splashBoozin;
  String get iconFootSteps;
  String get iconKcal;

  factory ImagePath(BuildContext context) => context.themeValue(
        light: ImagePathLight(),
        dark: ImagePathDark(),
      );
}
