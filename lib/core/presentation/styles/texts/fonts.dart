import 'dart:io';

enum FontFamilyType {
  bold,
  boldItalic,
  light,
  lightItalic,
  medium,
  mediumItalic,
  regular,
  italic,
}

extension FontFamilyTypeExtension on FontFamilyType {
  String adaptive() {
    if (this == FontFamilyType.bold) {
      if (Platform.isIOS) return 'Ubuntu-Bold';
      if (Platform.isAndroid) return 'Ubuntu-Bold';
    } else if (this == FontFamilyType.boldItalic) {
      if (Platform.isIOS) return 'Ubuntu-BoldItalic';
      if (Platform.isAndroid) return 'Ubuntu-BoldItalic';
    } else if (this == FontFamilyType.light) {
      if (Platform.isIOS) return 'Ubuntu-Light';
      if (Platform.isAndroid) return 'Ubuntu-Light';
    } else if (this == FontFamilyType.lightItalic) {
      if (Platform.isIOS) return 'Ubuntu-LightItalic';
      if (Platform.isAndroid) return 'Ubuntu-LightItalic';
    } else if (this == FontFamilyType.medium) {
      if (Platform.isIOS) return 'Ubuntu-Medium';
      if (Platform.isAndroid) return 'Ubuntu-Medium';
    } else if (this == FontFamilyType.mediumItalic) {
      if (Platform.isIOS) return 'Ubuntu-MediumItalic';
      if (Platform.isAndroid) return 'Ubuntu-MediumItalic';
    } else if (this == FontFamilyType.regular) {
      if (Platform.isIOS) return 'Ubuntu-Regular';
      if (Platform.isAndroid) return 'Ubuntu-Regular';
    } else if (this == FontFamilyType.italic) {
      if (Platform.isIOS) return 'Ubuntu-Italic';
      if (Platform.isAndroid) return 'Ubuntu-Italic';
    }

    return 'Ubuntu-Regular';
  }
}
