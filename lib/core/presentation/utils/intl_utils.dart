import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

String intlMessage(
  BuildContext? context, {
  required String Function(S s) localized,
  required String orElse,
}) {
  S? s;

  try {
    s = [
      if (context != null) S.maybeOf(context),
      S.current,
    ].whereNotNull().firstOrNull;
  } catch (e) {
    s = null;
  }

  if (s != null) return localized(s);

  return orElse;
}
