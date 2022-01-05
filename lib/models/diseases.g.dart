// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diseases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diseases _$DiseasesFromJson(Map<String, dynamic> json) => Diseases()
  ..level = json['level'] as num
  ..type = json['type'] as num
  ..diseaseName = json['diseaseName'] as String
  ..diseaseDuid = json['diseaseDuid'] as String
  ..diseaseVos = (json['diseaseVos'] as List<dynamic>)
      .map((e) => Diseases.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$DiseasesToJson(Diseases instance) => <String, dynamic>{
      'level': instance.level,
      'type': instance.type,
      'diseaseName': instance.diseaseName,
      'diseaseDuid': instance.diseaseDuid,
      'diseaseVos': instance.diseaseVos,
    };
