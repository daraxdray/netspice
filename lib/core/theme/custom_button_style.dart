import 'package:flutter/material.dart';
import 'package:my_tom/core/theme/theme_helper.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles 
 {

  // Filled button style
  static ButtonStyle get fillLime
 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.lime900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillOnSecondaryContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.onSecondaryContainer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimaryTL12 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary.withOpacity(0.53),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),

    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimaryTL121 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary.withOpacity(0.6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}