import 'package:flutter/material.dart';
class AppColors {
  static Color bitterSweetColor = AppColors.colorFromHex('#fe6f5e');
  static Color brightMaroonColor = AppColors.colorFromHex('#c32148');
  static Color whiteColor = AppColors.colorFromHex('#FFFFFF');
  static Color waterBlueColor = AppColors.colorFromHex('#1084CB');
  static Color roseMadderColor = AppColors.colorFromHex('#E31837');
  static Color primaryTitleColor = AppColors.colorFromHex('#4D4D4F');

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}