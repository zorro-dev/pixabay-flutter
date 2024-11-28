import 'package:json_annotation/json_annotation.dart';

part 'send_data.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class SendData<T> {
  SendData(this.data);

  T? data;

  factory SendData.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$SendDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$SendDataToJson(this, toJsonT);
}
