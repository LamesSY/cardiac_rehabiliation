// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_info_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetailInfo _$PatientDetailInfoFromJson(Map<String, dynamic> json) =>
    PatientDetailInfo()
      ..address = json['address'] as String?
      ..age = json['age'] as num?
      ..bedNo = json['bedNo'] as num?
      ..birthday = json['birthday'] as String?
      ..bmi = json['bmi'] as String?
      ..clinicalDiagnosis = json['clinicalDiagnosis'] as String?
      ..day = json['day'] as num?
      ..deptId = json['deptId'] as num?
      ..drugVos = (json['drugVos'] as List<dynamic>?)
          ?.map((e) => DrugMod.fromJson(e as Map<String, dynamic>))
          .toList()
      ..endTime = json['endTime'] as String?
      ..evaluateNumber = json['evaluateNumber'] as num?
      ..evaluateTime = json['evaluateTime'] as String?
      ..haDuid = json['haDuid'] as String?
      ..height = json['height'] as num?
      ..historyLastVo = json['historyLastVo'] == null
          ? null
          : HistoryLastMod.fromJson(
              json['historyLastVo'] as Map<String, dynamic>)
      ..hospitalDiseaseInfoVos =
          json['hospitalDiseaseInfoVos'] as List<HospitalDiseaseInfoMod>?
      ..hospitalNumber = json['hospitalNumber'] as String?
      ..medication = json['medication'] as String?
      ..nyha = json['nyha'] as num?
      ..phone = json['phone'] as String?
      ..sex = json['sex'] as num?
      ..startTime = json['startTime'] as String?
      ..state = json['state'] as num?
      ..submitDataVo = json['submitDataVo'] == null
          ? null
          : SubmitDataMod.fromJson(json['submitDataVo'] as Map<String, dynamic>)
      ..uid = json['uid'] as String?
      ..userName = json['userName'] as String?
      ..weight = json['weight'] as num?;

Map<String, dynamic> _$PatientDetailInfoToJson(PatientDetailInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'age': instance.age,
      'bedNo': instance.bedNo,
      'birthday': instance.birthday,
      'bmi': instance.bmi,
      'clinicalDiagnosis': instance.clinicalDiagnosis,
      'day': instance.day,
      'deptId': instance.deptId,
      'drugVos': instance.drugVos,
      'endTime': instance.endTime,
      'evaluateNumber': instance.evaluateNumber,
      'evaluateTime': instance.evaluateTime,
      'haDuid': instance.haDuid,
      'height': instance.height,
      'historyLastVo': instance.historyLastVo,
      'hospitalDiseaseInfoVos': instance.hospitalDiseaseInfoVos,
      'hospitalNumber': instance.hospitalNumber,
      'medication': instance.medication,
      'nyha': instance.nyha,
      'phone': instance.phone,
      'sex': instance.sex,
      'startTime': instance.startTime,
      'state': instance.state,
      'submitDataVo': instance.submitDataVo,
      'uid': instance.uid,
      'userName': instance.userName,
      'weight': instance.weight,
    };
