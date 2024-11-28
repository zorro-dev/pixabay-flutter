import 'package:flutter/cupertino.dart';

import 'app_texts.dart';
import 'fonts.dart';

final myBaseTextStyle = TextStyle();

final appTexts = AppTexts(
  title1: myTitle1,
  title2: myTitle2,
  title3: myTitle3,
  body1: myBody1,
  body2: myBody2,
  caption1: myCaption1,
  caption2: myCaption2,
);

final myTitle1 = Title1(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 28,
    //height: 34,
  ),
  bold: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.bold.adaptive(),
    fontSize: 28,
    //height: 34,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 28,
    //height: 34,
  ),
);

final myTitle2 = Title2(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 22,
    //height: 28,
  ),
  bold: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.bold.adaptive(),
    fontSize: 22,
    //height: 28,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 22,
    //height: 28,
  ),
);

final myTitle3 = Title3(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 20,
    //height: 25,
  ),
  bold: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.bold.adaptive(),
    fontSize: 20,
    //height: 25,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 20,
    //height: 25,
  ),
);

final myBody1 = Body1(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 16,
    //height: 24,
  ),
  bold: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.bold.adaptive(),
    fontSize: 16,
    //height: 24,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 16,
    //height: 24,
  ),
);

final myBody2 = Body2(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 14,
    //height: 20,
  ),
  bold: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.bold.adaptive(),
    fontSize: 14,
    //height: 20,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 14,
    //height: 20,
  ),
);

final myCaption1 = Caption1(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 12,
    //height: 16,
  ),
  bold: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.bold.adaptive(),
    fontSize: 12,
    //height: 16,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 12,
    //height: 16,
  ),
);

final myCaption2 = Caption2(
  medium: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.medium.adaptive(),
    fontSize: 10,
    //height: 16,
  ),
  regular: myBaseTextStyle.copyWith(
    fontFamily: FontFamilyType.regular.adaptive(),
    fontSize: 10,
    //height: 16,
  ),
);