import 'package:json_annotation/json_annotation.dart';

part 'drug_vo.g.dart';

@JsonSerializable()
class DrugMod {
  DrugMod();

  String? drugDuid;
  String? drugName;
  
  factory DrugMod.fromJson(Map<String,dynamic> json) => _$DrugModFromJson(json);
  Map<String, dynamic> toJson() => _$DrugModToJson(this);
}
