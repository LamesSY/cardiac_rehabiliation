// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChooseDrug _$ChooseDrugFromJson(Map<String, dynamic> json) => ChooseDrug()
  ..drugName = json['drugName'] as String
  ..drugDuid = json['drugDuid'] as String
  ..drugs = (json['drugs'] as List<dynamic>)
      .map((e) => ChooseDrug.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ChooseDrugToJson(ChooseDrug instance) =>
    <String, dynamic>{
      'drugName': instance.drugName,
      'drugDuid': instance.drugDuid,
      'drugs': instance.drugs,
    };
