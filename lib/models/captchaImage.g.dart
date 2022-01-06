// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captchaImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaptchaImage _$CaptchaImageFromJson(Map<String, dynamic> json) => CaptchaImage()
  ..msg = json['msg'] as String
  ..img = json['img'] as String
  ..code = json['code'] as num
  ..uuid = json['uuid'] as String;

Map<String, dynamic> _$CaptchaImageToJson(CaptchaImage instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'img': instance.img,
      'code': instance.code,
      'uuid': instance.uuid,
    };
