import 'package:json_annotation/json_annotation.dart';

part 'responsive.g.dart';

@JsonSerializable()
class ResponseX {
  int code;
  String msg;
  dynamic data;

  ResponseX(this.code, this.msg, this.data);

  factory ResponseX.fromJson(Map<String, dynamic> json) =>
      _$ResponseXFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseXToJson(this);
}
