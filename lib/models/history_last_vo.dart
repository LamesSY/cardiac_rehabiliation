import 'package:json_annotation/json_annotation.dart';

part 'history_last_vo.g.dart';

@JsonSerializable()
class HistoryLastMod {
  HistoryLastMod();

  String? lastEndTime;
  String? lastEvaluateTime;
  String? lastPrescribingTime;
  String? lastRecordTime;
  String? lastRecoveryTime;
  String? lastSportTime;
  
  factory HistoryLastMod.fromJson(Map<String,dynamic> json) => _$HistoryLastModFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryLastModToJson(this);
}
