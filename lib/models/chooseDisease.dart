import 'package:json_annotation/json_annotation.dart';

part 'chooseDisease.g.dart';

@JsonSerializable()
class ChooseDisease {
  ChooseDisease();

  late num level;
  late num type;
  late String diseaseName;
  late String diseaseDuid;
  late List<ChooseDisease> diseaseVos;
  
  factory ChooseDisease.fromJson(Map<String,dynamic> json) => _$ChooseDiseaseFromJson(json);
  Map<String, dynamic> toJson() => _$ChooseDiseaseToJson(this);
}
