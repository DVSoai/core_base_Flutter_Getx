import 'package:flutter/material.dart';

class AppThemeData {
  final Color primaryColor;
  final Color background;
  final Color secondaryColor1;
  final Color secondaryColor2;
  final Color secondaryColor3;
  final Color secondaryColor4;
  final Color secondaryColor5;
  final Color secondaryColor6;
  final Color secondaryColor7;
  final Color secondaryColor8;
  final Color secondaryColor9;
  final Color secondaryColor10;

  final Color neutral1;
  final Color neutral2;
  final Color neutral3;
  final Color neutral4;
  final Color neutral5;
  final Color neutral6;
  final Color neutral7;

  final Color neutral8;
  final Color neutral9;
  final Color neutral10;

  final Color shadeLight;
  final Color shadeDark1;
  final Color shadeDark2;
  final Color shadeDark3;
  final Color shadeDark4;
  final Color primaryColorDark;

  const AppThemeData(
      {required this.primaryColor,
        required this.background,
        required this.secondaryColor10,
        required this.primaryColorDark,
        required this.secondaryColor7,
        required this.secondaryColor8,
        required this.secondaryColor9,
        required this.secondaryColor1,
        required this.secondaryColor2,
        required this.neutral7,
        required this.neutral8,
        required this.neutral9,
        required this.neutral10,
        required this.secondaryColor3,
        required this.secondaryColor4,
        required this.secondaryColor5,
        required this.secondaryColor6,
        required this.neutral1,
        required this.neutral2,
        required this.neutral3,
        required this.neutral4,
        required this.neutral5,
        required this.neutral6,
        required this.shadeLight,
        required this.shadeDark1,
        required this.shadeDark2,
        required this.shadeDark3,
        required this.shadeDark4});
}

const lightAppThemeData = AppThemeData(
  background: Color(0xFFFFFFFF),
  neutral10: Color(0xFFFFFFFF),
  neutral9: Color(0xFFF3F3F3),
  neutral8: Color(0xFFEFEFEF),
  neutral7: Color(0xFFDCDCDC),
  neutral6: Color(0xFFC7C7C7),
  neutral5: Color(0xFFA3A3A3),
  neutral4: Color(0xFF8C8C8C),
  neutral3: Color(0xFF6A6A6A),
  neutral2: Color(0xFF3D3D3D),
  neutral1: Color(0xFF1D1D1D),
  primaryColor: Color(0xFF0070FF),
  primaryColorDark: Color(0xFF0070FF),
  shadeDark1: Color(0xFF1C1C1C),
  shadeDark2: Color(0xFF292929),
  shadeDark3: Color(0xFF9E9E9E),
  shadeDark4: Color(0xFFE2E2E2),
  shadeLight: Color(0xFF555555),
  secondaryColor1: Color(0xFFEC5353),
  secondaryColor2: Color(0xFFFF6C44),
  secondaryColor3: Color(0xFFFF9257),
  secondaryColor4: Color(0xFFFFECD7),
  secondaryColor5: Color(0xFFFFA01D),
  secondaryColor6: Color(0xFFFFBD30),
  secondaryColor7: Color(0xFFFFE03B),
  secondaryColor8: Color(0xFFFFF7AE),
  secondaryColor9: Color(0xFF04CD00),
  secondaryColor10: Color(0xFF2496FF),
);
const darkAppThemeData = AppThemeData(
  background: Color(0xFF1D1D1D),
  neutral1: Color(0xFFFFFFFF),
  neutral2: Color(0xFFF3F3F3),
  neutral3: Color(0xFFEFEFEF),
  neutral4: Color(0xFFDCDCDC),
  neutral5: Color(0xFFC7C7C7),
  neutral6: Color(0xFFA3A3A3),
  neutral7: Color(0xFF8C8C8C),
  neutral8: Color(0xFF6A6A6A),
  neutral9: Color(0xFF3D3D3D),
  neutral10: Color(0xFF1D1D1D),
  primaryColor: Color(0xFF0070FF),
  primaryColorDark: Color(0xFF0070FF),
  secondaryColor1: Color(0xFFEC5353),
  secondaryColor2: Color(0xFFFF6C44),
  secondaryColor3: Color(0xFFFF9257),
  secondaryColor4: Color(0xFFFFECD7),
  secondaryColor5: Color(0xFFFFA01D),
  secondaryColor6: Color(0xFFFFBD30),
  secondaryColor7: Color(0xFFFFE03B),
  secondaryColor8: Color(0xFFFFF7AE),
  secondaryColor9: Color(0xFF04CD00),
  secondaryColor10: Color(0xFF2496FF),
  shadeDark4: Color(0xFF1C1C1C),
  shadeDark3: Color(0xFF292929),
  shadeDark2: Color(0xFF9E9E9E),
  shadeDark1: Color(0xFFE2E2E2),
  shadeLight: Color(0xFF555555),
);
