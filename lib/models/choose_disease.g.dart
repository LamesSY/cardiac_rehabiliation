// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChooseDisease _$ChooseDiseaseFromJson(Map<String, dynamic> json) =>
    ChooseDisease()
      ..level = json['level'] as num
      ..type = json['type'] as num
      ..diseaseName = json['diseaseName'] as String
      ..diseaseDuid = json['diseaseDuid'] as String
      ..diseaseVos = (json['diseaseVos'] as List<dynamic>)
          .map((e) => ChooseDisease.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ChooseDiseaseToJson(ChooseDisease instance) =>
    <String, dynamic>{
      'level': instance.level,
      'type': instance.type,
      'diseaseName': instance.diseaseName,
      'diseaseDuid': instance.diseaseDuid,
      'diseaseVos': instance.diseaseVos,
    };
