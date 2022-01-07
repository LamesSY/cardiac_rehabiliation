// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_info_ummary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInfoSummary _$PatientInfoSummaryFromJson(Map<String, dynamic> json) =>
    PatientInfoSummary()
      ..records = (json['records'] as List<dynamic>?)
          ?.map((e) => PatientInfo.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = json['total'] as num?
      ..size = json['size'] as num?
      ..current = json['current'] as num?
      ..orders = json['orders'] as List<dynamic>?
      ..optimizeCountSql = json['optimizeCountSql'] as bool?
      ..hitCount = json['hitCount'] as bool?
      ..countId = json['countId'] as String?
      ..maxLimit = json['maxLimit'] as String?
      ..searchCount = json['searchCount'] as bool?
      ..pages = json['pages'] as num?;

Map<String, dynamic> _$PatientInfoSummaryToJson(PatientInfoSummary instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'orders': instance.orders,
      'optimizeCountSql': instance.optimizeCountSql,
      'hitCount': instance.hitCount,
      'countId': instance.countId,
      'maxLimit': instance.maxLimit,
      'searchCount': instance.searchCount,
      'pages': instance.pages,
    };
