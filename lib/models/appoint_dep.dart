import 'package:json_annotation/json_annotation.dart';

part 'appoint_dep.g.dart';

@JsonSerializable()
class AppointDep {
  AppointDep();

  late int deptId;
  late String deptName;
  late int countNumber;
  late int remainNumber;

  factory AppointDep.fromJson(Map<String, dynamic> json) =>
      _$AppointDepFromJson(json);
  Map<String, dynamic> toJson() => _$AppointDepToJson(this);
}
