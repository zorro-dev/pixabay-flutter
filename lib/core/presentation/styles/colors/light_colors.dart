import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/styles/colors/app_colors.dart';

final lightColors = AppColors(
  rainbow: lightRainbow,
  window: lightWindow,
  texts: lightTexts,
  appBar: lightAppBar,
  menu: lightMenu,
  buttons: lightButtons,
  inputs: lightInputs,
);

const lightRainbow = Rainbow(
  green: Colors.green,
  blue: Color(0xFF276FF9),
  red: Colors.red,
  orange: Color(0xFFFF9900),
  purple: Color(0xFF5A52E1),
);

const lightWindow = Window(
  background: Colors.white,
);

const lightTexts = Texts(
  text1: Colors.black,
  text2: Color(0xFF323232),
  text3: Color(0xFF8C8C8C),
  text4: Colors.black45,
  text5: Colors.black38,
);

final lightAppBar = AppBars(
  background: Colors.white,
  blurBackground: Colors.white.withOpacity(0.8),
  icon: Colors.black,
);

const lightMenu = Menu(
  background: Color(0xFFF8F8F8),
  text: Colors.black,
  divider: Color(0xFFE6E6E6),
  trailingIcon: Colors.black,
);

const lightButtons = Buttons(
  background1: Colors.black,
  icon1: Colors.white,
  text1: Colors.white,
  background2: Color(0xFFF8F8F8),
  icon2: Color(0xFF323232),
  text2: Color(0xFF8C8C8C),
);

const lightInputs = Inputs(
  background1: Color(0xFFF8F8F8),
  stroke1: Color(0xFFEDEDED),
  icon1: Color(0xFF323232),
  text1: Colors.black,
  hint1: Color(0xFF8C8C8C),
  error1: Color(0xFF890000),
  background2: Color(0xFFFFFFFF),
);
