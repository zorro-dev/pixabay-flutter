
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/presentation/styles/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/theme_repository.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  final SharedPreferences prefs;

  ThemeRepositoryImpl(this.prefs);

  String get key => "theme";

  @override
  Future<void> clearValue() async {
    await prefs.remove(key);
  }

  @override
  ThemeType? get() {
    final type = prefs.getString(key);
    return ThemeType.values.firstWhereOrNull((element) => element.name == type);
  }

  @override
  Future<void> storeValue(ThemeType value) async {
    await prefs.setString(key, value.name);
  }
}
