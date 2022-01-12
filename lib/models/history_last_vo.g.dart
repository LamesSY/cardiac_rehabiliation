// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_last_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryLastMod _$HistoryLastModFromJson(Map<String, dynamic> json) =>
    HistoryLastMod()
      ..lastEndTime = json['lastEndTime'] as String?
      ..lastEvaluateTime = json['lastEvaluateTime'] as String?
      ..lastPrescribingTime = json['lastPrescribingTime'] as String?
      ..lastRecordTime = json['lastRecordTime'] as String?
      ..lastRecoveryTime = json['lastRecoveryTime'] as String?
      ..lastSportTime = json['lastSportTime'] as String?;

Map<String, dynamic> _$HistoryLastModToJson(HistoryLastMod instance) =>
    <String, dynamic>{
      'lastEndTime': instance.lastEndTime,
      'lastEvaluateTime': instance.lastEvaluateTime,
      'lastPrescribingTime': instance.lastPrescribingTime,
      'lastRecordTime': instance.lastRecordTime,
      'lastRecoveryTime': instance.lastRecoveryTime,
      'lastSportTime': instance.lastSportTime,
    };
