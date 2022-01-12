import 'package:json_annotation/json_annotation.dart';

part 'hospital_disease_info_vo.g.dart';

@JsonSerializable()
class HospitalDiseaseInfoMod {
  HospitalDiseaseInfoMod();

  String? diseaseDuid;
  String? diseaseName;
  String? operationTime;
  num? type;
  
  factory HospitalDiseaseInfoMod.fromJson(Map<String,dynamic> json) => _$HospitalDiseaseInfoModFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalDiseaseInfoModToJson(this);
}
