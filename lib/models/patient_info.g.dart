// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) => PatientInfo()
  ..haDuid = json['haDuid'] as String?
  ..duid = json['duid'] as String?
  ..userName = json['userName'] as String?
  ..uid = json['uid'] as String?
  ..sex = json['sex'] as num?
  ..age = json['age'] as num?
  ..phone = json['phone'] as String?
  ..disease = json['disease'] as List<dynamic>?
  ..startTime = json['startTime'] as String?
  ..evaluateNumber = json['evaluateNumber'] as num?
  ..state = json['state'] as num?
  ..clinicalDiagnosis = json['clinicalDiagnosis'] as String?
  ..medication = json['medication'] as String?
  ..nyha = json['nyha'] as num?;

Map<String, dynamic> _$PatientInfoToJson(PatientInfo instance) =>
    <String, dynamic>{
      'haDuid': instance.haDuid,
      'duid': instance.duid,
      'userName': instance.userName,
      'uid': instance.uid,
      'sex': instance.sex,
      'age': instance.age,
      'phone': instance.phone,
      'disease': instance.disease,
      'startTime': instance.startTime,
      'evaluateNumber': instance.evaluateNumber,
      'state': instance.state,
      'clinicalDiagnosis': instance.clinicalDiagnosis,
      'medication': instance.medication,
      'nyha': instance.nyha,
    };
