// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primary100;
  late Color primary200;
  late Color primary300;
  late Color primary400;
  late Color primary500;
  late Color primary600;
  late Color primary700;
  late Color primary800;
  late Color primary900;
  late Color secondary100;
  late Color secondary200;
  late Color secondary300;
  late Color secondary400;
  late Color secondary500;
  late Color secondary600;
  late Color secondary700;
  late Color secondary800;
  late Color secondary900;
  late Color tertiary100;
  late Color tertiary200;
  late Color tertiary300;
  late Color tertiary400;
  late Color tertiary500;
  late Color tertiary600;
  late Color tertiary700;
  late Color tertiary800;
  late Color tertiary900;
  late Color black;
  late Color white;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFCE035F);
  late Color secondary = const Color(0xFFD43EED);
  late Color tertiary = const Color(0xFF02FFF4);
  late Color alternate = const Color(0xFFDBE2E7);
  late Color primaryText = const Color(0xFF14181B);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFFDF5F7);
  late Color accent1 = const Color(0x4CCE035F);
  late Color accent2 = const Color(0x4DD43EED);
  late Color accent3 = const Color(0x4C02FFF4);
  late Color accent4 = const Color(0xB3FFFFFF);
  late Color success = const Color(0xFF39D2C0);
  late Color warning = const Color(0xFFC96F46);
  late Color error = const Color(0xFFE65454);
  late Color info = const Color(0xFF1C4494);

  late Color primary100 = Color(0xFFFFCCDC);
  late Color primary200 = Color(0xFFECA4BA);
  late Color primary300 = Color(0xFFEF7DA0);
  late Color primary400 = Color(0xFFF24E80);
  late Color primary500 = Color(0xFFE03368);
  late Color primary600 = Color(0xFFCF295C);
  late Color primary700 = Color(0xFFB4224E);
  late Color primary800 = Color(0xFFA5133F);
  late Color primary900 = Color(0xFF8E0831);
  late Color secondary100 = Color(0xFFE1F1BC);
  late Color secondary200 = Color(0xFFCEE993);
  late Color secondary300 = Color(0xFFBCDE6B);
  late Color secondary400 = Color(0xFFAFD751);
  late Color secondary500 = Color(0xFFA3D139);
  late Color secondary600 = Color(0xFF97BD33);
  late Color secondary700 = Color(0xFF88A52A);
  late Color secondary800 = Color(0xFF798D21);
  late Color secondary900 = Color(0xFF626615);
  late Color tertiary100 = Color(0xFFEEE0FB);
  late Color tertiary200 = Color(0xFFDCC0F7);
  late Color tertiary300 = Color(0xFFCBA1F2);
  late Color tertiary400 = Color(0xFFB981EE);
  late Color tertiary500 = Color(0xFFA862EA);
  late Color tertiary600 = Color(0xFF864EBB);
  late Color tertiary700 = Color(0xFF653B8C);
  late Color tertiary800 = Color(0xFF43275E);
  late Color tertiary900 = Color(0xFF22142F);
  late Color black = Color(0xFF000000);
  late Color white = Color(0xFFFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Plus Jakarta Sans';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Plus Jakarta Sans';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Plus Jakarta Sans';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 34.0,
      );
  String get headlineLargeFamily => 'Plus Jakarta Sans';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Plus Jakarta Sans';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Plus Jakarta Sans';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Plus Jakarta Sans';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Plus Jakarta Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Space Grotesk';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get titleSmallFamily => 'Space Grotesk';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelLargeFamily => 'Space Grotesk';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Space Grotesk';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Space Grotesk';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Space Grotesk';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.primaryText,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Space Grotesk';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Space Grotesk';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Space Grotesk',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFCE035F);
  late Color secondary = const Color(0xFFD43EED);
  late Color tertiary = const Color(0xFF02FFF4);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF1F1216);
  late Color secondaryBackground = const Color(0xFFFDF5F7);
  late Color accent1 = const Color(0x4CCE035F);
  late Color accent2 = const Color(0x4DD43EED);
  late Color accent3 = const Color(0x4C02FFF4);
  late Color accent4 = const Color(0xCD14181B);
  late Color success = const Color(0xFF39D2C0);
  late Color warning = const Color(0xFFC96F46);
  late Color error = const Color(0xFFE65454);
  late Color info = const Color(0xFFFFFFFF);

  late Color primary100 = Color(0xFF913D52);
  late Color primary200 = Color(0xFF332857);
  late Color primary300 = Color(0xFF749B7A);
  late Color primary400 = Color(0xFFACEBCE);
  late Color primary500 = Color(0xFFBF4C6E);
  late Color primary600 = Color(0xFF0BE081);
  late Color primary700 = Color(0xFF01B206);
  late Color primary800 = Color(0xFFC235F3);
  late Color primary900 = Color(0xFF77C6C5);
  late Color secondary100 = Color(0xFFC25995);
  late Color secondary200 = Color(0xFFB8CCDF);
  late Color secondary300 = Color(0xFF2F8B6B);
  late Color secondary400 = Color(0xFF6002A8);
  late Color secondary500 = Color(0xFFEE7891);
  late Color secondary600 = Color(0xFF5288C5);
  late Color secondary700 = Color(0xFF629E4B);
  late Color secondary800 = Color(0xFFBD413C);
  late Color secondary900 = Color(0xFF3C0742);
  late Color tertiary100 = Color(0xFF75B3A2);
  late Color tertiary200 = Color(0xFFD1ACB3);
  late Color tertiary300 = Color(0xFF6F9F30);
  late Color tertiary400 = Color(0xFF158761);
  late Color tertiary500 = Color(0xFF223286);
  late Color tertiary600 = Color(0xFF416632);
  late Color tertiary700 = Color(0xFFF80AE2);
  late Color tertiary800 = Color(0xFF01EE0C);
  late Color tertiary900 = Color(0xFF51D734);
  late Color black = Color(0xFFE03949);
  late Color white = Color(0xFFA09849);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
