// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appoint_dep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointDep _$AppointDepFromJson(Map<String, dynamic> json) => AppointDep()
  ..deptId = json['deptId'] as int
  ..deptName = json['deptName'] as String
  ..countNumber = json['countNumber'] as int
  ..remainNumber = json['remainNumber'] as int;

Map<String, dynamic> _$AppointDepToJson(AppointDep instance) =>
    <String, dynamic>{
      'deptId': instance.deptId,
      'deptName': instance.deptName,
      'countNumber': instance.countNumber,
      'remainNumber': instance.remainNumber,
    };
