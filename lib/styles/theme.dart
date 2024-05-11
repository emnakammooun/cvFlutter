import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../provider/provider.dart';

ThemeData kCustomTheme(UiProvider uiProvider) {
  final backgroundColor = uiProvider.isDark ? CustomColor.bgLight2 : Colors.white;
  final textColor = uiProvider.isDark ? Colors.white : Colors.black;

  return ThemeData.dark().copyWith(
    iconTheme: const IconThemeData(
      color: CustomColor.whitePrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: CustomColor.yellowPrimary, // Set text color for the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        fixedSize: const Size.fromHeight(45),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
    backgroundColor: backgroundColor, // Set background color
    textTheme: TextTheme(
      bodyText1: TextStyle(color: textColor), // Set text color
      bodyText2: TextStyle(color: textColor), // Set text color
      subtitle1: TextStyle(color: textColor), // Set text color
      subtitle2: TextStyle(color: textColor), // Set text color
      headline6: TextStyle(color: textColor), // Set text color
    ),
  );
}
