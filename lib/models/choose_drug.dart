import 'package:json_annotation/json_annotation.dart';
part 'choose_drug.g.dart';

@JsonSerializable()
class ChooseDrug {
  ChooseDrug();

  late String drugName;
  late String drugDuid;
  late List<ChooseDrug> drugs;

  factory ChooseDrug.fromJson(Map<String, dynamic> json) =>
      _$ChooseDrugFromJson(json);
  Map<String, dynamic> toJson() => _$ChooseDrugToJson(this);
}
