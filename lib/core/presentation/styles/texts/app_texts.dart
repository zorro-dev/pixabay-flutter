import 'package:flutter/material.dart';

class AppTexts extends ThemeExtension<AppTexts> {
  final Title1 title1;
  final Title2 title2;
  final Title3 title3;

  final Body1 body1;
  final Body2 body2;

  final Caption1 caption1;
  final Caption2 caption2;

  const AppTexts({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.body1,
    required this.body2,
    required this.caption1,
    required this.caption2,
  });

  @override
  ThemeExtension<AppTexts> copyWith({
    Title1? title1,
    Title2? title2,
    Title3? title3,
    Body1? body1,
    Body2? body2,
    Caption1? caption1,
    Caption2? caption2,
  }) {
    return AppTexts(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
    );
  }

  @override
  ThemeExtension<AppTexts> lerp(
      covariant ThemeExtension<AppTexts>? other, double t) {
    if (other is! AppTexts) {
      return this;
    }

    return AppTexts(
      title1: Title1(
        bold: TextStyle.lerp(title1.bold, other.title1.bold, t)!,
        medium: TextStyle.lerp(title1.medium, other.title1.medium, t)!,
        regular: TextStyle.lerp(title1.regular, other.title1.regular, t)!,
      ),
      title2: Title2(
        bold: TextStyle.lerp(title2.bold, other.title2.bold, t)!,
        medium: TextStyle.lerp(title2.medium, other.title2.medium, t)!,
        regular: TextStyle.lerp(title2.regular, other.title2.regular, t)!,
      ),
      title3: Title3(
        bold: TextStyle.lerp(title3.bold, other.title3.bold, t)!,
        medium: TextStyle.lerp(title3.medium, other.title3.medium, t)!,
        regular: TextStyle.lerp(title3.regular, other.title3.regular, t)!,
      ),
      body1: Body1(
        bold: TextStyle.lerp(body1.bold, other.body1.bold, t)!,
        medium: TextStyle.lerp(body1.medium, other.body1.medium, t)!,
        regular: TextStyle.lerp(body1.regular, other.body1.regular, t)!,
      ),
      body2: Body2(
        bold: TextStyle.lerp(body2.bold, other.body2.bold, t)!,
        medium: TextStyle.lerp(body2.medium, other.body2.medium, t)!,
        regular: TextStyle.lerp(body2.regular, other.body2.regular, t)!,
      ),
      caption1: Caption1(
        bold: TextStyle.lerp(caption1.bold, other.caption1.bold, t)!,
        medium: TextStyle.lerp(caption1.medium, other.caption1.medium, t)!,
        regular: TextStyle.lerp(caption1.regular, other.caption1.regular, t)!,
      ),
      caption2: Caption2(
        medium: TextStyle.lerp(caption2.medium, other.caption2.medium, t)!,
        regular: TextStyle.lerp(caption2.regular, other.caption2.regular, t)!,
      ),
    );
  }
}

class Title1 {
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle regular;

  Title1({
    required this.medium,
    required this.bold,
    required this.regular,
  });
}

class Title2 {
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle regular;

  Title2({
    required this.medium,
    required this.bold,
    required this.regular,
  });
}

class Title3 {
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle regular;

  Title3({
    required this.medium,
    required this.bold,
    required this.regular,
  });
}

class Body1 {
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle regular;

  Body1({
    required this.medium,
    required this.bold,
    required this.regular,
  });
}

class Body2 {
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle regular;

  Body2({
    required this.medium,
    required this.bold,
    required this.regular,
  });
}

class Caption1 {
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle regular;

  Caption1({
    required this.medium,
    required this.bold,
    required this.regular,
  });
}

class Caption2 {
  final TextStyle medium;
  final TextStyle regular;

  Caption2({
    required this.medium,
    required this.regular,
  });
}
