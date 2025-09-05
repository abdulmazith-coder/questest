
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;
  
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension CustomTextStyles on BuildContext {
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}