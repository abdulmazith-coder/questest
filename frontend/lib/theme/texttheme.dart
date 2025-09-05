import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';


class QuesTestTheme{

    static TextTheme textTheme = const TextTheme().copyWith(
      headlineLarge:TextStyle(fontWeight: FontWeight.w700, color:ColorsQuestest.black,fontFamily:'Inter'),
      headlineMedium:TextStyle(fontWeight: FontWeight.w500, color:ColorsQuestest.black,fontFamily:'Inter'),
      headlineSmall:TextStyle(fontWeight: FontWeight.w400, color:ColorsQuestest.black,fontFamily:'Inter'),

      titleLarge: TextStyle(fontWeight: FontWeight.w700, color:ColorsQuestest.black,fontFamily:'Inter'),
      titleMedium: TextStyle(fontWeight: FontWeight.w500, color:ColorsQuestest.black,fontFamily:'Inter'),
      titleSmall:  TextStyle(fontWeight: FontWeight.w400, color:ColorsQuestest.black,fontFamily:'Inter'),

      bodyLarge: TextStyle(fontWeight: FontWeight.w700, color:ColorsQuestest.black,fontFamily:'Inter'),
      bodyMedium: TextStyle(fontWeight: FontWeight.w500, color:ColorsQuestest.black,fontFamily:'Inter'),
      bodySmall:  TextStyle(fontWeight: FontWeight.w400, color:ColorsQuestest.black,fontFamily:'Inter'), 

      labelLarge: TextStyle(fontWeight: FontWeight.w700, color:ColorsQuestest.black,fontFamily:'Inter'),
      labelMedium: TextStyle(fontWeight: FontWeight.w500, color:ColorsQuestest.black,fontFamily:'Inter'),
      labelSmall:  TextStyle(fontWeight: FontWeight.w400, color:ColorsQuestest.black,fontFamily:'Inter'),
    );

}