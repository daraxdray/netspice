import 'package:flutter/material.dart';
import 'package:my_tom/core/theme/theme_helper.dart';


extension on TextStyle {
  TextStyle get poppins => copyWith(fontFamily: 'Poppins');
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
///
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  static const String _fontFamily =
      'YourFontFamily'; // Replace with your font family

  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Base text style
  static TextStyle _baseStyle(
      {required double fontSize,
      FontWeight fontWeight = regular,
      Color color = Colors.black,
      double? height,
      TextDecoration? decoration,
      double? letterSpacing}) {
    return TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        decoration: decoration,
        letterSpacing: letterSpacing);
  }

  static TextStyle boldBlack = theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle normalBlack = theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal);
  static TextStyle lightBlack = theme.textTheme.titleSmall!.copyWith();
  static TextStyle greyNormal = theme.textTheme.titleSmall!.copyWith();
  static TextStyle greyBold = theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold);

  static TextStyle h1 = theme.textTheme.headlineLarge!;

  static TextStyle h2 =
      theme.textTheme.headlineMedium!;

  static TextStyle h3 = theme.textTheme.headlineSmall!;

  static TextStyle h4 = theme.textTheme.titleLarge!;

  static TextStyle h5 = theme.textTheme.titleMedium!;

  static TextStyle h6 = theme.textTheme.titleSmall!;

  // Body text
  static TextStyle bodyLarge = theme.textTheme.bodyLarge!;

  static TextStyle bodyMedium = theme.textTheme.bodyMedium!;

  static TextStyle bodySmall = theme.textTheme.bodySmall!;
  //body text
  static TextStyle body =
      theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onSurface);
  static TextStyle formLabel =
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray700);
  // Button text
  static TextStyle button =
      theme.textTheme.labelLarge!.copyWith(color: Colors.white);
  static TextStyle buttonDark =
      theme.textTheme.labelLarge!.copyWith(color: Colors.grey);

  // Caption
  static TextStyle caption = theme.textTheme.bodySmall!;

  // Overline
  static TextStyle overline = theme.textTheme.labelMedium!;

  // Custom styles
  static TextStyle customStyle({
    required double fontSize,
    FontWeight fontWeight = regular,
    Color color = Colors.black,
    double? height,
    TextDecoration? decoration,
  }) =>
      _baseStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        decoration: decoration,
      );
}
