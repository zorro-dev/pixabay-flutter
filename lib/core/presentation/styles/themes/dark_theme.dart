import 'package:flutter/material.dart';

import '../colors/dark_colors.dart';
import '../texts/my_texts.dart';
import '../themes/app_theme.dart';

final darkTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF276FF9),
    brightness: Brightness.dark,
  ),
).copyWith(
  extensions: [
    AppTheme(
      texts: appTexts,
      colors: darkColors,
    ),
  ],
);
