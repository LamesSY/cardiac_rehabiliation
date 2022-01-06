import 'package:json_annotation/json_annotation.dart';

part 'captchaImage.g.dart';

@JsonSerializable()
class CaptchaImage {
  CaptchaImage();

  late String msg;
  late String img;
  late num code;
  late String uuid;
  
  factory CaptchaImage.fromJson(Map<String,dynamic> json) => _$CaptchaImageFromJson(json);
  Map<String, dynamic> toJson() => _$CaptchaImageToJson(this);
}
