import 'package:json_annotation/json_annotation.dart';

part 'submit_data_vo.g.dart';

@JsonSerializable()
class SubmitDataMod {
  SubmitDataMod();

  num? count1;
  num? count2;
  num? count3;
  num? count4;
  num? count5;
  num? count6;
  String? countTime;
  num? frequencyCount1;
  num? frequencyCount2;
  num? frequencyCount3;
  num? frequencyCount4;
  num? frequencyCount5;
  num? frequencyDesc1;
  num? frequencyDesc2;
  num? frequencyDesc3;
  num? frequencyDesc4;
  num? frequencyDesc5;
  String? frequencyTime;
  String? hospitalDuid;
  String? hospitalName;

  factory SubmitDataMod.fromJson(Map<String, dynamic> json) =>
      _$SubmitDataModFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitDataModToJson(this);
}
