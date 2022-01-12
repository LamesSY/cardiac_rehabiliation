// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_disease_info_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalDiseaseInfoMod _$HospitalDiseaseInfoModFromJson(
        Map<String, dynamic> json) =>
    HospitalDiseaseInfoMod()
      ..diseaseDuid = json['diseaseDuid'] as String?
      ..diseaseName = json['diseaseName'] as String?
      ..operationTime = json['operationTime'] as String?
      ..type = json['type'] as num?;

Map<String, dynamic> _$HospitalDiseaseInfoModToJson(
        HospitalDiseaseInfoMod instance) =>
    <String, dynamic>{
      'diseaseDuid': instance.diseaseDuid,
      'diseaseName': instance.diseaseName,
      'operationTime': instance.operationTime,
      'type': instance.type,
    };
