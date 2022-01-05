import 'package:json_annotation/json_annotation.dart';

part 'diseases.g.dart';

@JsonSerializable()
class Diseases {
  Diseases();

  late num level;
  late num type;
  late String diseaseName;
  late String diseaseDuid;
  late List<Diseases> diseaseVos;
  
  factory Diseases.fromJson(Map<String,dynamic> json) => _$DiseasesFromJson(json);
  Map<String, dynamic> toJson() => _$DiseasesToJson(this);
}
