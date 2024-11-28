import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/language_repository.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl extends LanguageRepository {
  final SharedPreferences prefs;

  LanguageRepositoryImpl(this.prefs);

  String get key => "language";

  @override
  Future<void> clearValue() async {
    await prefs.remove(key);
  }

  @override
  String? get() {
    return prefs.getString(key);
  }

  @override
  Future<void> storeValue(String value) async {
    await prefs.setString(key, value);
  }
}
