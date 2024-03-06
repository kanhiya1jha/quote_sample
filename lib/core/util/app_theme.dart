import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signifydemo/core/common_widgets/responsive_size.dart';

import 'app_colors.dart';
import 'app_constants_string.dart';

class AppThemes {
  static final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      primarySwatch: white,
      fontFamily: "Georama",
    textTheme: TextTheme(
      labelSmall: GoogleFonts.georama().copyWith(
          fontSize: AppFontsSize.small,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTitleColor),

      labelMedium: GoogleFonts.georama().copyWith(
          fontSize: AppFontsSize.medium,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTitleColor),
      labelLarge: GoogleFonts.georama().copyWith(
          fontSize: AppFontsSize.large,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTitleColor),
      titleLarge: GoogleFonts.georama().copyWith(
          fontSize: AppFontsSize.extraLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTitleColor),
    ),
    useMaterial3: true,
  );
}

extension TextThemeExtension on TextTheme {
  TextStyle get labelMediumSemibold => GoogleFonts.georama().copyWith(
      fontSize: AppFontsSize.medium,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTitleColor);

  TextStyle get labelLargeRegularRed => GoogleFonts.georama().copyWith(
      fontSize: AppFontsSize.large,
      fontWeight: FontWeight.w500,
      color: Colors.red);

  TextStyle get labelLargeSemibold => GoogleFonts.georama().copyWith(
      fontSize: AppFontsSize.large,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTitleColor);

  TextStyle get labelLargeSemiboldWaterBlueColor => GoogleFonts.georama().copyWith(
      fontSize: AppFontsSize.large,
      fontWeight: FontWeight.w600,
      color: AppColors.waterBlueColor);

  TextStyle get titleLargeSemibold => GoogleFonts.georama().copyWith(
      fontSize: AppFontsSize.extraLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTitleColor);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
const MaterialColor white =  MaterialColor(
  0xFFFFFFFF,
   <int, Color>{
    50:  Color(0xFFFFFFFF),
    100:  Color(0xFFFFFFFF),
    200:  Color(0xFFFFFFFF),
    300:  Color(0xFFFFFFFF),
    400:  Color(0xFFFFFFFF),
    500:  Color(0xFFFFFFFF),
    600:  Color(0xFFFFFFFF),
    700:  Color(0xFFFFFFFF),
    800:  Color(0xFFFFFFFF),
    900:  Color(0xFFFFFFFF),
  },
);


class Style {
  static TextStyle? labelSmall(BuildContext context) {
   return ScreenType.isSmallScreen(context) ?  Theme.of(context).textTheme.labelSmall :
   ScreenType.isLargeScreen(context) ? Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: AppFontsSize.smallWeb)
   :Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: AppFontsSize.smallTablet);
  }
  static TextStyle? labelMedium(BuildContext context) {
    return ScreenType.isSmallScreen(context) ?  Theme.of(context).textTheme.labelMedium :
    ScreenType.isLargeScreen(context) ? Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: AppFontsSize.mediumWeb)
        :Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: AppFontsSize.mediumTablet);
  }
  static TextStyle? labelLarge(BuildContext context) {
    return ScreenType.isSmallScreen(context) ?  Theme.of(context).textTheme.labelLarge :
    ScreenType.isLargeScreen(context) ? Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: AppFontsSize.largeWeb)
        :Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: AppFontsSize.largeTablet);
  }
  static TextStyle? titleLarge(BuildContext context) {
    return ScreenType.isSmallScreen(context) ?  Theme.of(context).textTheme.titleLarge :
    ScreenType.isLargeScreen(context) ? Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: AppFontsSize.extraLargeWeb)
        :Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: AppFontsSize.extraLargeTablet);
  }
}
