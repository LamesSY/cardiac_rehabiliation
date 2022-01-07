import 'package:json_annotation/json_annotation.dart';
import 'patient_info.dart';
part 'patient_info_ummary.g.dart';

@JsonSerializable()
class PatientInfoSummary {
  PatientInfoSummary();

  List<PatientInfo>? records;
  num? total;
  num? size;
  num? current;
  List? orders;
  bool? optimizeCountSql;
  bool? hitCount;
  String? countId;
  String? maxLimit;
  bool? searchCount;
  num? pages;

  factory PatientInfoSummary.fromJson(Map<String, dynamic> json) =>
      _$PatientInfoSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$PatientInfoSummaryToJson(this);
}
