import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/styles/colors/app_colors.dart';

final darkColors = AppColors(
  rainbow: darkRainbow,
  window: darkWindow,
  texts: darkTexts,
  appBar: darkAppBar,
  menu: darkMenu,
  buttons: darkButtons,
  inputs: darkInputs,
);

const darkRainbow = Rainbow(
  green: Colors.green,
  blue: Color(0xFF276FF9),
  red: Colors.red,
  orange: Color(0xFFFF9900),
  purple: Color(0xFF5A52E1),
);

const darkWindow = Window(
  background: Color(0xFF1C1C1C),
);

const darkTexts = Texts(
  text1: Colors.white,
  text2: Color(0xFFDCDCDC),
  text3: Colors.grey,
  text4: Colors.grey,
  text5: Colors.grey,
);

final darkAppBar = AppBars(
  background: Color(0xFF1C1C1C),
  blurBackground: Color(0xFF1C1C1C).withOpacity(0.8),
  icon: Colors.white,
);

const darkMenu = Menu(
  background: Color(0xFF212121),
  text: Color(0xFFF8F8F8),
  divider: Color(0xFF2E2E2E),
  trailingIcon: Color(0xFFF8F8F8),
);

const darkButtons = Buttons(
  background1: Color(0xFFF8F8F8),
  icon1: Colors.black,
  text1: Colors.black,

  background2: Color(0xFF2A2A2A),
  icon2: Colors.white,
  text2: Color(0xFFFFFFFF),
);

const darkInputs = Inputs(
  background1: Color(0xFF2A2A2A),
  stroke1: Color(0xFF222222),
  icon1: Color(0xFFFFFFFF),
  text1: Colors.white,
  hint1: Color(0xFF3A3A3A),
  error1: Color(0xFFBC0000),
  background2: Color(0xFF000000),
);
