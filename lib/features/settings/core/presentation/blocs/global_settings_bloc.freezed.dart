// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalSettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(ThemeType type) updatedTheme,
    required TResult Function(String language) updatedLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(ThemeType type)? updatedTheme,
    TResult? Function(String language)? updatedLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(ThemeType type)? updatedTheme,
    TResult Function(String language)? updatedLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitSettingEvent value) init,
    required TResult Function(UpdatedThemeSettingEvent value) updatedTheme,
    required TResult Function(UpdatedLanguageSettingEvent value)
        updatedLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitSettingEvent value)? init,
    TResult? Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult? Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitSettingEvent value)? init,
    TResult Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingsEventCopyWith<$Res> {
  factory $GlobalSettingsEventCopyWith(
          GlobalSettingsEvent value, $Res Function(GlobalSettingsEvent) then) =
      _$GlobalSettingsEventCopyWithImpl<$Res, GlobalSettingsEvent>;
}

/// @nodoc
class _$GlobalSettingsEventCopyWithImpl<$Res, $Val extends GlobalSettingsEvent>
    implements $GlobalSettingsEventCopyWith<$Res> {
  _$GlobalSettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitSettingEventImplCopyWith<$Res> {
  factory _$$InitSettingEventImplCopyWith(_$InitSettingEventImpl value,
          $Res Function(_$InitSettingEventImpl) then) =
      __$$InitSettingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitSettingEventImplCopyWithImpl<$Res>
    extends _$GlobalSettingsEventCopyWithImpl<$Res, _$InitSettingEventImpl>
    implements _$$InitSettingEventImplCopyWith<$Res> {
  __$$InitSettingEventImplCopyWithImpl(_$InitSettingEventImpl _value,
      $Res Function(_$InitSettingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitSettingEventImpl implements InitSettingEvent {
  const _$InitSettingEventImpl();

  @override
  String toString() {
    return 'GlobalSettingsEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitSettingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(ThemeType type) updatedTheme,
    required TResult Function(String language) updatedLanguage,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(ThemeType type)? updatedTheme,
    TResult? Function(String language)? updatedLanguage,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(ThemeType type)? updatedTheme,
    TResult Function(String language)? updatedLanguage,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitSettingEvent value) init,
    required TResult Function(UpdatedThemeSettingEvent value) updatedTheme,
    required TResult Function(UpdatedLanguageSettingEvent value)
        updatedLanguage,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitSettingEvent value)? init,
    TResult? Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult? Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitSettingEvent value)? init,
    TResult Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitSettingEvent implements GlobalSettingsEvent {
  const factory InitSettingEvent() = _$InitSettingEventImpl;
}

/// @nodoc
abstract class _$$UpdatedThemeSettingEventImplCopyWith<$Res> {
  factory _$$UpdatedThemeSettingEventImplCopyWith(
          _$UpdatedThemeSettingEventImpl value,
          $Res Function(_$UpdatedThemeSettingEventImpl) then) =
      __$$UpdatedThemeSettingEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeType type});
}

/// @nodoc
class __$$UpdatedThemeSettingEventImplCopyWithImpl<$Res>
    extends _$GlobalSettingsEventCopyWithImpl<$Res,
        _$UpdatedThemeSettingEventImpl>
    implements _$$UpdatedThemeSettingEventImplCopyWith<$Res> {
  __$$UpdatedThemeSettingEventImplCopyWithImpl(
      _$UpdatedThemeSettingEventImpl _value,
      $Res Function(_$UpdatedThemeSettingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$UpdatedThemeSettingEventImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ThemeType,
    ));
  }
}

/// @nodoc

class _$UpdatedThemeSettingEventImpl implements UpdatedThemeSettingEvent {
  const _$UpdatedThemeSettingEventImpl({required this.type});

  @override
  final ThemeType type;

  @override
  String toString() {
    return 'GlobalSettingsEvent.updatedTheme(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedThemeSettingEventImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedThemeSettingEventImplCopyWith<_$UpdatedThemeSettingEventImpl>
      get copyWith => __$$UpdatedThemeSettingEventImplCopyWithImpl<
          _$UpdatedThemeSettingEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(ThemeType type) updatedTheme,
    required TResult Function(String language) updatedLanguage,
  }) {
    return updatedTheme(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(ThemeType type)? updatedTheme,
    TResult? Function(String language)? updatedLanguage,
  }) {
    return updatedTheme?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(ThemeType type)? updatedTheme,
    TResult Function(String language)? updatedLanguage,
    required TResult orElse(),
  }) {
    if (updatedTheme != null) {
      return updatedTheme(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitSettingEvent value) init,
    required TResult Function(UpdatedThemeSettingEvent value) updatedTheme,
    required TResult Function(UpdatedLanguageSettingEvent value)
        updatedLanguage,
  }) {
    return updatedTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitSettingEvent value)? init,
    TResult? Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult? Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
  }) {
    return updatedTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitSettingEvent value)? init,
    TResult Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
    required TResult orElse(),
  }) {
    if (updatedTheme != null) {
      return updatedTheme(this);
    }
    return orElse();
  }
}

abstract class UpdatedThemeSettingEvent implements GlobalSettingsEvent {
  const factory UpdatedThemeSettingEvent({required final ThemeType type}) =
      _$UpdatedThemeSettingEventImpl;

  ThemeType get type;

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedThemeSettingEventImplCopyWith<_$UpdatedThemeSettingEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedLanguageSettingEventImplCopyWith<$Res> {
  factory _$$UpdatedLanguageSettingEventImplCopyWith(
          _$UpdatedLanguageSettingEventImpl value,
          $Res Function(_$UpdatedLanguageSettingEventImpl) then) =
      __$$UpdatedLanguageSettingEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$UpdatedLanguageSettingEventImplCopyWithImpl<$Res>
    extends _$GlobalSettingsEventCopyWithImpl<$Res,
        _$UpdatedLanguageSettingEventImpl>
    implements _$$UpdatedLanguageSettingEventImplCopyWith<$Res> {
  __$$UpdatedLanguageSettingEventImplCopyWithImpl(
      _$UpdatedLanguageSettingEventImpl _value,
      $Res Function(_$UpdatedLanguageSettingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$UpdatedLanguageSettingEventImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatedLanguageSettingEventImpl implements UpdatedLanguageSettingEvent {
  const _$UpdatedLanguageSettingEventImpl({required this.language});

  @override
  final String language;

  @override
  String toString() {
    return 'GlobalSettingsEvent.updatedLanguage(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedLanguageSettingEventImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedLanguageSettingEventImplCopyWith<_$UpdatedLanguageSettingEventImpl>
      get copyWith => __$$UpdatedLanguageSettingEventImplCopyWithImpl<
          _$UpdatedLanguageSettingEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(ThemeType type) updatedTheme,
    required TResult Function(String language) updatedLanguage,
  }) {
    return updatedLanguage(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(ThemeType type)? updatedTheme,
    TResult? Function(String language)? updatedLanguage,
  }) {
    return updatedLanguage?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(ThemeType type)? updatedTheme,
    TResult Function(String language)? updatedLanguage,
    required TResult orElse(),
  }) {
    if (updatedLanguage != null) {
      return updatedLanguage(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitSettingEvent value) init,
    required TResult Function(UpdatedThemeSettingEvent value) updatedTheme,
    required TResult Function(UpdatedLanguageSettingEvent value)
        updatedLanguage,
  }) {
    return updatedLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitSettingEvent value)? init,
    TResult? Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult? Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
  }) {
    return updatedLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitSettingEvent value)? init,
    TResult Function(UpdatedThemeSettingEvent value)? updatedTheme,
    TResult Function(UpdatedLanguageSettingEvent value)? updatedLanguage,
    required TResult orElse(),
  }) {
    if (updatedLanguage != null) {
      return updatedLanguage(this);
    }
    return orElse();
  }
}

abstract class UpdatedLanguageSettingEvent implements GlobalSettingsEvent {
  const factory UpdatedLanguageSettingEvent({required final String language}) =
      _$UpdatedLanguageSettingEventImpl;

  String get language;

  /// Create a copy of GlobalSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedLanguageSettingEventImplCopyWith<_$UpdatedLanguageSettingEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GlobalSettingsState {
  ThemeType get type => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  /// Create a copy of GlobalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalSettingsStateCopyWith<GlobalSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingsStateCopyWith<$Res> {
  factory $GlobalSettingsStateCopyWith(
          GlobalSettingsState value, $Res Function(GlobalSettingsState) then) =
      _$GlobalSettingsStateCopyWithImpl<$Res, GlobalSettingsState>;
  @useResult
  $Res call({ThemeType type, String language});
}

/// @nodoc
class _$GlobalSettingsStateCopyWithImpl<$Res, $Val extends GlobalSettingsState>
    implements $GlobalSettingsStateCopyWith<$Res> {
  _$GlobalSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ThemeType,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalSettingsStateImplCopyWith<$Res>
    implements $GlobalSettingsStateCopyWith<$Res> {
  factory _$$GlobalSettingsStateImplCopyWith(_$GlobalSettingsStateImpl value,
          $Res Function(_$GlobalSettingsStateImpl) then) =
      __$$GlobalSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeType type, String language});
}

/// @nodoc
class __$$GlobalSettingsStateImplCopyWithImpl<$Res>
    extends _$GlobalSettingsStateCopyWithImpl<$Res, _$GlobalSettingsStateImpl>
    implements _$$GlobalSettingsStateImplCopyWith<$Res> {
  __$$GlobalSettingsStateImplCopyWithImpl(_$GlobalSettingsStateImpl _value,
      $Res Function(_$GlobalSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? language = null,
  }) {
    return _then(_$GlobalSettingsStateImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ThemeType,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GlobalSettingsStateImpl implements _GlobalSettingsState {
  const _$GlobalSettingsStateImpl(
      {this.type = ThemeType.light, this.language = "en"});

  @override
  @JsonKey()
  final ThemeType type;
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'GlobalSettingsState(type: $type, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSettingsStateImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, language);

  /// Create a copy of GlobalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSettingsStateImplCopyWith<_$GlobalSettingsStateImpl> get copyWith =>
      __$$GlobalSettingsStateImplCopyWithImpl<_$GlobalSettingsStateImpl>(
          this, _$identity);
}

abstract class _GlobalSettingsState implements GlobalSettingsState {
  const factory _GlobalSettingsState(
      {final ThemeType type,
      final String language}) = _$GlobalSettingsStateImpl;

  @override
  ThemeType get type;
  @override
  String get language;

  /// Create a copy of GlobalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalSettingsStateImplCopyWith<_$GlobalSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
