import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/font_sizde_constants.dart';

class AppTextTheme {
  final Color color;

  TextTheme get textTheme => TextTheme(
    displayLarge: TextStyle(
        color: color,
        fontSize: FontSizeConstants.displayLarge,
        fontFamily: AppConstants.fontName,
        letterSpacing: AppConstants.letterSpacing,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
        color: color,
        fontSize: FontSizeConstants.displayMedium,
        fontFamily: AppConstants.fontName,
        letterSpacing: AppConstants.letterSpacing,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700),
    displaySmall: TextStyle(
        color: color,
        fontSize: FontSizeConstants.displaySmall,
        letterSpacing: AppConstants.letterSpacing,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700),
    titleLarge: TextStyle(
        color: color,
        fontSize: FontSizeConstants.titleLarge,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        letterSpacing: AppConstants.letterSpacing,
        fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        color: color,
        fontSize: FontSizeConstants.titleMedium,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        letterSpacing: AppConstants.letterSpacing,
        fontWeight: FontWeight.w600),
    titleSmall: TextStyle(
        color: color,
        fontSize: FontSizeConstants.titleSmall,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        letterSpacing: AppConstants.letterSpacing,
        fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(
        color: color,
        fontSize: FontSizeConstants.bodyLarge,
        fontFamily: AppConstants.fontName,
        letterSpacing: AppConstants.letterSpacing,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        color: color,
        fontSize: FontSizeConstants.bodyMedium,
        fontFamily: AppConstants.fontName,
        letterSpacing: AppConstants.letterSpacing,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    bodySmall: TextStyle(
        color: color,
        fontSize: FontSizeConstants.bodySmall,
        letterSpacing: AppConstants.letterSpacing,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        color: color,
        fontSize: FontSizeConstants.labelLarge,
        letterSpacing: AppConstants.letterSpacing,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    labelMedium: TextStyle(
        color: color,
        fontSize: FontSizeConstants.labelMedium,
        fontFamily: AppConstants.fontName,
        letterSpacing: AppConstants.letterSpacing,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
    labelSmall: TextStyle(
        color: color,
        fontSize: FontSizeConstants.labelSmall,
        letterSpacing: AppConstants.letterSpacing,
        fontFamily: AppConstants.fontName,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal),
  ).apply(fontFamily: AppConstants.fontName);

  AppTextTheme(this.color);
}