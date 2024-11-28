import 'package:flutter/material.dart';

import '../colors/black_colors.dart';
import '../texts/my_texts.dart';
import '../themes/app_theme.dart';

final blackTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF276FF9),
    brightness: Brightness.dark,
  ),
).copyWith(
  extensions: [
    AppTheme(
      texts: appTexts,
      colors: blackColors,
    ),
  ],
);
