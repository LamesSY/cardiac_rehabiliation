import 'package:json_annotation/json_annotation.dart';
import 'drug_vo.dart';
import 'history_last_vo.dart';
import 'hospital_disease_info_vo.dart';
import 'submit_data_vo.dart';
part 'patient_info_detail.g.dart';

@JsonSerializable()
class PatientDetailInfo {
  PatientDetailInfo();

  String? address;
  num? age;
  num? bedNo;
  String? birthday;
  String? bmi;
  String? clinicalDiagnosis;
  num? day;
  num? deptId;
  List<DrugMod>? drugVos;
  String? endTime;
  num? evaluateNumber;
  String? evaluateTime;
  String? haDuid;
  num? height;
  HistoryLastMod? historyLastVo;
  List<HospitalDiseaseInfoMod>? hospitalDiseaseInfoVos;
  String? hospitalNumber;
  String? medication;
  num? nyha;
  String? phone;
  num? sex;
  String? startTime;
  num? state;
  SubmitDataMod? submitDataVo;
  String? uid;
  String? userName;
  num? weight;

  factory PatientDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PatientDetailInfoToJson(this);
}
