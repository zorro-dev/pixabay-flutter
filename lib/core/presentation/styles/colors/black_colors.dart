import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/styles/colors/app_colors.dart';

final blackColors = AppColors(
  rainbow: blackRainbow,
  window: blackWindow,
  texts: blackTexts,
  appBar: blackAppBar,
  menu: blackMenu,
  buttons: blackButtons,
  inputs: blackInputs,
);

const blackRainbow = Rainbow(
  green: Colors.green,
  blue: Color(0xFF276FF9),
  red: Colors.red,
  orange: Color(0xFFFF9900),
  purple: Color(0xFF5A52E1),
);

const blackWindow = Window(
  background: Colors.black,
);

const blackTexts = Texts(
  text1: Colors.white,
  text2: Color(0xFFDCDCDC),
  text3: Colors.grey,
  text4: Colors.grey,
  text5: Colors.grey,
);

final blackAppBar = AppBars(
  background: Colors.black,
  blurBackground: Colors.black.withOpacity(0.8),
  icon: Colors.white,
);

const blackMenu = Menu(
  background: Color(0xFF0E0E0E),
  text: Color(0xFFF8F8F8),
  divider: Color(0xFF151515),
  trailingIcon: Color(0xFFF8F8F8),
);

const blackButtons = Buttons(
  background1: Color(0xFFF8F8F8),
  icon1: Colors.black,
  text1: Colors.black,
  background2: Color(0xFF2A2A2A),
  icon2: Colors.white,
  text2: Color(0xFFFFFFFF),
);

const blackInputs = Inputs(
  background1: Color(0xFF0E0E0E),
  stroke1: Color(0xFF121212),
  icon1: Color(0xFF323232),
  text1: Colors.white,
  hint1: Color(0xFF3A3A3A),
  error1: Color(0xFFBC0000),
  background2: Color(0xFF000000),
);