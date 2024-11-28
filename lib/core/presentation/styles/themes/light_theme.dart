import 'package:flutter/material.dart';

import '../colors/light_colors.dart';
import '../texts/my_texts.dart';
import '../themes/app_theme.dart';

final lightTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF276FF9),
    brightness: Brightness.light,
  ),
).copyWith(
  extensions: [
    AppTheme(
      texts: appTexts,
      colors: lightColors,
    ),
  ],
);
