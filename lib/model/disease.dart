import 'package:flutter/material.dart';

class Disease {
  final int level;
  final int type;
  final String diseaseName;
  final String diseaseDuid;
  final List<Disease> diseaseVos;

  Disease(
    this.level,
    this.type,
    this.diseaseName,
    this.diseaseDuid,
    this.diseaseVos,
  );

  Disease.fromJson(Map<String, dynamic> json)
      : level = json["level"],
        type = json["type"],
        diseaseName = json["diseaseName"],
        diseaseDuid = json["diseaseDuid"],
        diseaseVos = json["diseaseVos"];

  Map<String, dynamic> toJson() => <String, dynamic>{
        "level": level,
        "type": type,
        "diseaseName": diseaseName,
        "diseaseDuid": diseaseDuid,
        "diseaseVos": diseaseVos
      };
}
