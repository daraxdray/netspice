import 'package:flutter/material.dart';
import 'package:my_tom/core/theme/theme_helper.dart';

class AppDecoration {
  static BoxDecoration get black => BoxDecoration(
    color: theme.colorScheme.onSecondaryContainer.withOpacity(0.4),
  );

  // Blur decorations
  static BoxDecoration get blurLarge => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.62, -0.02),
      end: Alignment(0.5, 1),
      colors: [appTheme.gray500C4, appTheme.gray700C4, appTheme.gray400C4],
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration get blurSmall => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
    borderRadius: BorderRadius.circular(8),
  );

  // Dark decorations
  static BoxDecoration get dark900 => BoxDecoration(
    color: theme.colorScheme.onSecondaryContainer,
  );

  // Error decorations
  static BoxDecoration get error500 => BoxDecoration(
    color: appTheme.redA400,
  );

  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray10002,
  );

  static BoxDecoration get fillGreenA => BoxDecoration(
    color: appTheme.greenA100,
  );

  static BoxDecoration get fillLimeA => BoxDecoration(
    color: appTheme.limeA70004,
  );

  // Foundation decorations
  static BoxDecoration get foundationPrimary500 => BoxDecoration(
    color: appTheme.limeA70002,
  );

  // Gradient decorations
  static BoxDecoration get gradientGrayToGray => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.gray60002, 
 appTheme.gray40000],
    ),
  );

  static BoxDecoration get gradientLightGreenAToOnPrimaryContainer => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.64, 1.16),
      end: Alignment(0.48, -0.17),
      colors: [
        appTheme.lightGreenA700,
        theme.colorScheme.onPrimaryContainer,
        theme.colorScheme.onPrimaryContainer,
      ],
    ),
  );

  // Grey decorations
  static BoxDecoration get grey100 => BoxDecoration(
    color: appTheme.gray50,
  );

  static BoxDecoration get grey300 => BoxDecoration(
    color: appTheme.gray100,
  );

  static BoxDecoration get grey400 => BoxDecoration(
    color: appTheme.gray50,
    border: Border.all(
      color: appTheme.gray10002,
      width: 1,
    ),
  );

  static BoxDecoration get grey500 => BoxDecoration(
    color: appTheme.gray10003,
  );

  static BoxDecoration get grey700 => BoxDecoration(
    border: Border.all(
      color: appTheme.gray500,
      width: 1,
    ),
  );
}


class BorderRadiusStyle {
  static BorderRadius get circleBorder48 => BorderRadius.circular(48);

  // Custom borders
  static BorderRadius get customBorderBL1 => BorderRadius.vertical(bottom: Radius.circular(1));

  static BorderRadius get customBorderTL12 => BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
    bottomLeft: Radius.circular(2),
  );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(12);

  static BorderRadius get roundedBorder16  
 => BorderRadius.circular(16);

  static BorderRadius get roundedBorder174 
 => BorderRadius.circular(174);

  static BorderRadius get roundedBorder24 => BorderRadius.circular(24);

  static BorderRadius get roundedBorder44 => BorderRadius.circular(44);

  static BorderRadius get roundedBorder8 => BorderRadius.circular(8);

  // Outline decorations
static BoxDecoration get outlineAmber => BoxDecoration(
  color: appTheme.amber1002d,
  border: Border.all(
    color: appTheme.amber500,
    width: 1.5,
    strokeAlign: BorderSide.strokeAlignCenter,
  ),
);

static BoxDecoration get outlineLimeA => BoxDecoration(
  color: appTheme.lime20059,
  border: Border.all(
    color: appTheme.limeA70001,
    width: 1.5,
    strokeAlign: BorderSide.strokeAlignCenter,
  ),
);

static BoxDecoration get primary300 => BoxDecoration(
  color: theme.colorScheme.secondaryContainer,
);

static BoxDecoration get primary500 => BoxDecoration(
  color: theme.colorScheme.primary,
);

// White decorations
static BoxDecoration get white => BoxDecoration(
  color: appTheme.gray50.withOpacity(0.1),
  border: Border.all(
    color: theme.colorScheme.onPrimaryContainer,
    width: 0.75,
  ),
);
}