import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomColorConverter implements JsonConverter<Color?, String?> {
  const CustomColorConverter();

  @override
  Color? fromJson(String? json) {
    if (json == null) return null;

    final value = int.tryParse(json.replaceFirst('#', '0xff'));
    if (value == null) return null;

    return Color(value);
  }

  @override
  String? toJson(Color? color) {
    if (color == null) return null;
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime json) => json.toUtc().toIso8601String();
}

class CustomObjectDateTimeConverter implements JsonConverter<DateTime, Map<String, dynamic>> {
  const CustomObjectDateTimeConverter();

  @override
  DateTime fromJson(Map<String, dynamic> json) => DateTime.parse(json["date"] as String).toLocal();

  @override
  Map<String, dynamic> toJson(DateTime date) =>
      {"utcDate": date.toUtc().toIso8601String(), "date": date.toIso8601String()};
}