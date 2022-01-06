import 'package:json_annotation/json_annotation.dart';
import "patientInfo.dart";
part 'patientList.g.dart';

@JsonSerializable()
class PatientList {
  PatientList();

  late List<PatientInfo> records;
  late num total;
  late num size;
  late num current;
  late List orders;
  late bool optimizeCountSql;
  late bool hitCount;
  late String countId;
  late String maxLimit;
  late bool searchCount;
  late num pages;
  
  factory PatientList.fromJson(Map<String,dynamic> json) => _$PatientListFromJson(json);
  Map<String, dynamic> toJson() => _$PatientListToJson(this);
}
