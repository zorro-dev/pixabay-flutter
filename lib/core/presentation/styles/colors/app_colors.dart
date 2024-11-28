import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Rainbow rainbow;
  final Window window;
  final Texts texts;
  final AppBars appBar;
  final Menu menu;
  final Buttons buttons;
  final Inputs inputs;

  const AppColors({
    required this.rainbow,
    required this.window,
    required this.texts,
    required this.appBar,
    required this.menu,
    required this.buttons,
    required this.inputs,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Rainbow? rainbow,
    Window? window,
    Texts? texts,
    AppBars? appBar,
    Menu? menu,
    Buttons? buttons,
    Inputs? inputs,
  }) {
    return AppColors(
      rainbow: rainbow ?? this.rainbow,
      window: window ?? this.window,
      texts: texts ?? this.texts,
      appBar: appBar ?? this.appBar,
      menu: menu ?? this.menu,
      buttons: buttons ?? this.buttons,
      inputs: inputs ?? this.inputs,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      rainbow: Rainbow(
        green: Color.lerp(rainbow.green, other.rainbow.green, t)!,
        blue: Color.lerp(rainbow.blue, other.rainbow.blue, t)!,
        red: Color.lerp(rainbow.red, other.rainbow.red, t)!,
        orange: Color.lerp(rainbow.orange, other.rainbow.orange, t)!,
        purple: Color.lerp(rainbow.purple, other.rainbow.purple, t)!,
      ),
      window: Window(
        background: Color.lerp(window.background, other.window.background, t)!,
      ),
      texts: Texts(
        text1: Color.lerp(texts.text1, other.texts.text1, t)!,
        text2: Color.lerp(texts.text2, other.texts.text2, t)!,
        text3: Color.lerp(texts.text3, other.texts.text3, t)!,
        text4: Color.lerp(texts.text4, other.texts.text4, t)!,
        text5: Color.lerp(texts.text5, other.texts.text5, t)!,
      ),
      appBar: AppBars(
        background: Color.lerp(appBar.background, other.appBar.background, t)!,
        blurBackground: Color.lerp(appBar.blurBackground, other.appBar.blurBackground, t)!,
        icon: Color.lerp(appBar.icon, other.appBar.icon, t)!,
      ),
      menu: Menu(
        background: Color.lerp(menu.background, other.menu.background, t)!,
        text: Color.lerp(menu.text, other.menu.text, t)!,
        divider: Color.lerp(menu.divider, other.menu.divider, t)!,
        trailingIcon: Color.lerp(menu.trailingIcon, other.menu.trailingIcon, t)!,
      ),
      buttons: Buttons(
        text1: Color.lerp(buttons.text1, other.buttons.text1, t)!,
        icon1: Color.lerp(buttons.icon1, other.buttons.icon1, t)!,
        background1: Color.lerp(buttons.background1, other.buttons.background1, t)!,
        text2: Color.lerp(buttons.text2, other.buttons.text2, t)!,
        icon2: Color.lerp(buttons.icon2, other.buttons.icon2, t)!,
        background2: Color.lerp(buttons.background2, other.buttons.background2, t)!,
      ),
      inputs: Inputs(
        background1: Color.lerp(inputs.background1, other.inputs.background1, t)!,
        stroke1: Color.lerp(inputs.stroke1, other.inputs.stroke1, t)!,
        icon1: Color.lerp(inputs.icon1, other.inputs.icon1, t)!,
        hint1: Color.lerp(inputs.hint1, other.inputs.hint1, t)!,
        text1: Color.lerp(inputs.text1, other.inputs.text1, t)!,
        error1: Color.lerp(inputs.error1, other.inputs.error1, t)!,
        background2: Color.lerp(inputs.background2, other.inputs.background2, t)!,
      ),
    );
  }
}

class Rainbow {
  final Color green;
  final Color blue;
  final Color red;
  final Color orange;
  final Color purple;

  const Rainbow({
    required this.green,
    required this.blue,
    required this.red,
    required this.orange,
    required this.purple,
  });
}

class Window {
  final Color background;

  const Window({
    required this.background,
  });
}

class Texts {
  final Color text1;
  final Color text2;
  final Color text3;
  final Color text4;
  final Color text5;

  const Texts({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });
}

class AppBars {
  final Color background;
  final Color blurBackground;
  final Color icon;

  const AppBars({
    required this.background,
    required this.blurBackground,
    required this.icon,
  });
}

class Menu {
  final Color background;
  final Color divider;
  final Color text;
  final Color trailingIcon;

  const Menu({
    required this.background,
    required this.divider,
    required this.text,
    required this.trailingIcon,
  });
}

class Buttons {
  final Color background1;
  final Color icon1;
  final Color text1;

  final Color background2;
  final Color icon2;
  final Color text2;

  const Buttons({
    required this.background1,
    required this.icon1,
    required this.text1,
    required this.background2,
    required this.icon2,
    required this.text2,
  });
}

class Inputs {
  final Color background1;
  final Color stroke1;
  final Color icon1;
  final Color hint1;
  final Color text1;
  final Color error1;

  final Color background2;

  const Inputs({
    required this.background1,
    required this.stroke1,
    required this.icon1,
    required this.hint1,
    required this.text1,
    required this.error1,
    required this.background2,
  });
}
