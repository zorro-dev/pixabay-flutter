import 'dart:io';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:pixabay_flutter/core/presentation/styles/themes/app_theme.dart';
import 'package:pixabay_flutter/features/settings/core/domain/repositories/language_repository.dart';
import 'package:pixabay_flutter/features/settings/core/domain/repositories/theme_repository.dart';
import 'package:pixabay_flutter/features/settings/language/presentation/language_settings_page.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

part 'global_settings_bloc.freezed.dart';

@lazySingleton
class GlobalSettingsBloc extends Bloc<GlobalSettingsEvent, GlobalSettingsState> {
  final LanguageRepository languageRepository;
  final ThemeRepository themeRepository;

  GlobalSettingsBloc(
    this.languageRepository,
    this.themeRepository,
  ) : super(const GlobalSettingsState()) {
    on<InitSettingEvent>(_init);
    on<UpdatedThemeSettingEvent>(_updatedTheme);
    on<UpdatedLanguageSettingEvent>(_updatedLanguage);
  }

  _init(InitSettingEvent event, Emitter<GlobalSettingsState> emit) async {
    {
      final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

      final systemThemeType = switch (brightness) {
        Brightness.light => ThemeType.light,
        Brightness.dark => ThemeType.black,
      };

      ThemeType? themeType = themeRepository.get();
      if (themeType == null) await themeRepository.set(systemThemeType);
      themeType = themeRepository.get();
      if (themeType != null) emit(state.copyWith(type: themeType));
    }

    {
      String systemLanguage = Intl.shortLocale(Platform.localeName);

      final isSupportLanguage = languages.firstWhereOrNull((element) => element.code == systemLanguage) != null;

      if (!isSupportLanguage) {
        systemLanguage = languages.first.code;
      }

      String? language = languageRepository.get();
      if (language == null) await languageRepository.set(systemLanguage);
      language = languageRepository.get();
      if (language != null) add(GlobalSettingsEvent.updatedLanguage(language: language));
    }
  }

  _updatedTheme(UpdatedThemeSettingEvent event, Emitter<GlobalSettingsState> emit) {
    themeRepository.set(event.type);
    emit(state.copyWith(type: event.type));
  }

  _updatedLanguage(UpdatedLanguageSettingEvent event, Emitter<GlobalSettingsState> emit) async {
    languageRepository.set(event.language);
    await S.delegate.load(Locale(event.language));
    emit(state.copyWith(language: event.language));
  }
}

@freezed
class GlobalSettingsEvent with _$GlobalSettingsEvent {
  const factory GlobalSettingsEvent.init() = InitSettingEvent;

  const factory GlobalSettingsEvent.updatedTheme({required ThemeType type}) = UpdatedThemeSettingEvent;

  const factory GlobalSettingsEvent.updatedLanguage({required String language}) = UpdatedLanguageSettingEvent;
}

@freezed
class GlobalSettingsState with _$GlobalSettingsState {
  const factory GlobalSettingsState({
    @Default(ThemeType.light) ThemeType type,
    @Default("en") String language,
  }) = _GlobalSettingsState;
}
