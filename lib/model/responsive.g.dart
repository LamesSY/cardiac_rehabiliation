// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseX _$ResponseXFromJson(Map<String, dynamic> json) => ResponseX(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ResponseXToJson(ResponseX instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };