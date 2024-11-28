import 'package:flutter/material.dart';
import '../texts/app_texts.dart';
import '../colors/app_colors.dart';
import 'black_theme.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

enum ThemeType { light, dark, black }

ThemeData _getTheme(ThemeType type) {
  return switch (type) {
    ThemeType.light => lightTheme,
    ThemeType.dark => darkTheme,
    ThemeType.black => blackTheme,
  };
}

ThemeData getTheme(ThemeType type) {
  final appTheme = _getTheme(type);
  final theme = appTheme.extension<AppTheme>()!;
  return appTheme.copyWith(
    scaffoldBackgroundColor: theme.colors.window.background,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          allowEnterRouteSnapshotting: false,
        ),
      },
    ),
  );
}

ThemeMode getThemeMode(ThemeType type) {
  return switch (type) {
    ThemeType.light => ThemeMode.light,
    ThemeType.dark => ThemeMode.dark,
    ThemeType.black => ThemeMode.dark,
  };
}

class AppTheme extends ThemeExtension<AppTheme> {
  final AppTexts texts;
  final AppColors colors;

  const AppTheme({
    required this.texts,
    required this.colors,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    AppTexts? texts,
    AppColors? colors,
  }) {
    return AppTheme(
      texts: texts ?? this.texts,
      colors: colors ?? this.colors,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      texts: texts.lerp(other.texts, t) as AppTexts,
      colors: colors.lerp(other.colors, t) as AppColors,
    );
  }
}
