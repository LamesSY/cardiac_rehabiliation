import 'package:json_annotation/json_annotation.dart';

part 'patientInfo.g.dart';

@JsonSerializable()
class PatientInfo {
  PatientInfo();

  late String haDuid;
  late String duid;
  late String userName;
  late String uid;
  late num sex;
  late num age;
  late String phone;
  late List disease;
  late String startTime;
  late num evaluateNumber;
  late num state;
  late String clinicalDiagnosis;
  late String medication;
  late num nyha;
  
  factory PatientInfo.fromJson(Map<String,dynamic> json) => _$PatientInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PatientInfoToJson(this);
}
