import 'package:json_annotation/json_annotation.dart';

part 'patient_info.g.dart';

@JsonSerializable()
class PatientInfo {
  PatientInfo();

  String? haDuid;
  String? duid;
  String? userName;
  String? uid;
  num? sex;
  num? age;
  String? phone;
  List? disease;
  String? startTime;
  num? evaluateNumber;
  num? state;
  String? clinicalDiagnosis;
  String? medication;
  num? nyha;

  factory PatientInfo.fromJson(Map<String, dynamic> json) =>
      _$PatientInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PatientInfoToJson(this);
}
