import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/app_exports.dart';



LightCodeColors get appTheme => ThemeHelper().themeColors();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app   

  static String _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  static Map<String, LightCodeColors> _supportedCustomColor = {
'lightCode': LightCodeColors(),
'darkCode':LightCodeColors(),
  };

  // A map of color schemes supported by the app
  static Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode':ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to newTheme.
  static void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the LightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side:
 BorderSide(
            color: appTheme.gray30001,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: appTheme.gray300,
          width: 1,
        ),
        visualDensity: const VisualDensity(vertical: -4,
        horizontal: -4)
      ),
      dividerTheme: DividerThemeData(thickness: 1, space: 1, color: appTheme.gray10002)
    );
  }
LightCodeColors themeColors() => _getThemeColors();
ThemeData themeData() => _getThemeData();
}

// Text theme styles
class TextThemes {
static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    
  bodyLarge: TextStyle(
    color: colorScheme.onSecondaryContainer,
    fontSize: 10,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    color: appTheme.gray500,
    fontSize: 9,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    color: appTheme.gray500,
//     fontSize:  12,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w400,
  ),
  headlineLarge: TextStyle(
    color: appTheme.black90001,
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  ),
  headlineMedium: TextStyle(
    color: appTheme.lime50,
    // fontSize: 16,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    color: colorScheme.onSecondaryContainer,
    // fontSize: 14,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w700,
  ),
  labelLarge: TextStyle(
    color: appTheme.gray700,
    // fontSize: 12,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w500,
  ),
  labelMedium: TextStyle(
    color: appTheme.amber600,
    // fontSize: 10,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w500,
  ),
  titleLarge: TextStyle(
    color: Colors.black,
    // fontSize: 20,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w600,
  ),
  titleMedium: TextStyle(
    color: Colors.black45,
    // fontSize:  18,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w700,
  ),
  titleSmall:  TextStyle(
    color: appTheme.gray600,
    // fontSize: 12,
    fontFamily: 'Poppins',
    // fontWeight: FontWeight.w500
  )
);

}

// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme =  ColorScheme.light(
    primary: Color(0xFF9BE005),
    secondary: Color.fromARGB(255, 175, 220, 78),
    primaryContainer: Color(0xFF3F3D56),
    secondaryContainer: Color(0xFFBFCE58),
    errorContainer: Color(0xFF787878),
    onError: Color(0XFFABDD00),
    onErrorContainer: Color(0XFF121215),
    onPrimary: Color(0XFF1E2114),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFF1F2A2F),
    
  );
  static const darkCodeColorScheme =  ColorScheme.dark(
    primary: Color(0xFF9BE005),
    secondary: Color.fromARGB(255, 175, 220, 78),
    primaryContainer: Color(0xFF3F3D56),
    secondaryContainer: Color(0xFFBFCE58),
    errorContainer: Color(0xFF787878),
    onError: Color(0XFFABDD00),
    onErrorContainer: Color(0XFF121215),
    onPrimary: Color(0XFF1E2114),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFF1F2A2F),
  );
}

class LightCodeColors {
  // Amber
  Color get amber1002d => Color(0xDFDEBB9);
  Color get amber100 => Color(0xFFFFFBEB);
  Color get amber200 => Color(0xFFFFE8D7);
  Color get amber300 => Color(0xFFFFD8C1);
  Color get amber400 => Color(0xFFFFC8A7);
  Color get amber500 => Color(0xFFFFB888);
  Color get amber600 => Color(0xFFFFA768);
  Color get amber700 => Color(0xFFFF9748);
  Color get amber800 => Color(0xFFFF8727);
  Color get amber900 => Color(0xFFFF7707);

  // Black
  Color get black900 => Color(0xFF000000);
  Color get black90001 => Color(0xFF000001);

  // BlueGray
  Color get blueGray100 => Color(0xFFCCCCCC);
  Color get blueGray800 => Color(0xFF34484F);
  Color get blueGray900 => Color(0xFF2F2E41);
  Color get blueGray90001 => Color(0xFF2A282A);
  Color get blueGray90002 => Color(0xFF181818);
  Color get blueGray90003 => Color(0xFF261838);
  
  Color get profileBg => Color(0xFF1C1C1E);

  

  // Cyan
  Color get cyan200 => Color(0xFFB1C7DF);

  // DeepOrange
  Color get deepOrange100 => Color(0xFFFFB888);
  Color get Orange400 => Color(0xFFFFBF0C); 

  // Gray
  Color get white100 => Color(0xFFFFFFFF);

  Color get gray100 => Color(0xFFF6F6F6);
  Color get gray10001 => Color(0xFFF2F3F4);
  Color get gray10002 => Color(0xFFF5F5F5);
  Color get gray10003 => Color(0xFFF2F2F2);
  Color get gray200 => Color(0xFFEBEBEB);
  Color get gray300 => Color(0xFFE0E0E8);
  Color get gray30001 => Color(0xFFDCDCDC);
  Color get gray30002 => Color(0xFFDBDBDB);
  Color get gray400 => Color(0xFFBDBCBC);
  Color get gray40000 => Color(0xFFBCBCBC);
  Color get gray40001 => Color(0xFFC2CACB);
  Color get gray50 => Color(0xFFFFFBFB);
  Color get gray500 => Color(0xFFACACAC);
  Color get gray50001 => Color(0xFF919898);
  Color get gray600 => Color(0xFF868585);
  Color get gray60001 => Color(0xFF658585);
  Color get gray60002 => Color(0xFF6C6CBC);
  Color get gray700 => Color(0xFF666666);
  Color get gray800 => Color(0xFF50512F);
  Color get gray900 => Color(0xFF101C1A);
  Color get gray90001 => Color(0xFF121212);

  // GrayC
  Color get gray400C4 => Color(0xFFCBCBCB);
  Color get gray500C4 => Color(0xFFC4979C);
  Color get gray700C4 => Color(0xFF666695);

  // Green
  Color get green400 => Color(0xFF4DE750);
  Color get green500 => Color(0xFF3CB448);
  Color get green50001 => Color(0xFF438553);
  Color get green800 => Color(0xFF127438);
  Color get green100 => Color(0xFFCAFFDB);
  Color get greenA100 => Color(0xFFCAFFDB);

  // LightBlue
  Color get lightBlueA700 => Color(0xFF0078FF);

  // LightGreen
  Color get lightGreen50 => Color(0xFFEFFF0);
  Color get lightGreen800 => Color(0xFF557883);
  Color get lightGreenA188 => Color(0xFFDCFF91);
  Color get lightGreenA700 => Color(0xFF18CC00);

  // Line
  Color get line20059 => Color(0xFF5907FF);

  // Lime
  Color get lime20059 => Color(0x59D7FFAF);
  Color get lime50 => Color(0xFFFFFCE6);
  Color get lime900 => Color(0xFF659584);
  Color get limeA700 => Color(0xFFBDCC85);
  Color get limeA70001 => Color(0xFFA7F400);
  Color get limeA70002 => Color(0xFFA5FF8A);
  Color get limeA70003 => Color(0xFF96E509);
  Color get limeA70004 => Color(0xFFABE101);

  // Red
  Color get redA50 => Color(0xFFffe6e9);
  Color get redA100 => Color(0xFFffb0bc);
  Color get redA200 => Color(0xFFff8a9b);
  Color get redA300 => Color(0xFFff546e);
  Color get redA400 => Color(0xFFff3351);
  Color get redA500 => Color(0xFFff0026);
  Color get redA600 => Color(0xFFe80023);
  Color get redA700 => Color(0xFFb5001b);
  Color get redA800 => Color(0xFF8c0015);
  Color get redA900 => Color(0xFF660010);


  // Teal
  Color get teal200 => Color(0xFF92CACB);
  Color get teal700 => Color(0xFFBB8A4C);

  // Yellow
  Color get yellow50 => Color(0xFFFFFDEF);



   Color get warning50 => Color(0xFFdfdeea);
  Color get warning100 => Color(0xFFfabbbe);
  Color get warning200 => Color(0xFFf7f99e);
  Color get warning300 => Color(0xFFf4f672);
  Color get warning400 => Color(0xFFf1f556);
  Color get warning500 => Color(0xFFeef22c);
  Color get warning600 => Color(0xFFd9dc28);
  Color get warning700 => Color(0xFFa9ac1f);
  Color get warning800 => Color(0xFF838518);
  Color get warning900 => Color(0xFF646612);
}