import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_flutter/core/presentation/styles/themes/app_theme.dart';
import 'package:pixabay_flutter/features/settings/core/presentation/blocs/global_settings_bloc.dart';

extension ContextExtensions<T> on BuildContext {

  ThemeData get themeData => Theme.of(this);

  AppTheme? get maybeTheme => Theme.of(this).extension<AppTheme>();
  AppTheme get theme => maybeTheme!;

  String get appLanguage => read<GlobalSettingsBloc>().state.language;

}
