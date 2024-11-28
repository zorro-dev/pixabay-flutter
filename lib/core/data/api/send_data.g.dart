// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendData<T> _$SendDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SendData<T>(
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$SendDataToJson<T>(
  SendData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
