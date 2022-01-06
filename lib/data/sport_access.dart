import 'package:flutter/material.dart';

class WorkBenchPreCardEntity {
  final String svgSrc, subTitle;
  final bool hasData;
  final Color bgColor;
  WorkBenchPreCardEntity(this.svgSrc, this.subTitle,
      {this.hasData = true, this.bgColor = Colors.white});
}

List<WorkBenchPreCardEntity> sportAccessList = [
  WorkBenchPreCardEntity("assets/icons/ic_add_circle_tran.svg", "快速建档",
      hasData: false, bgColor: Colors.blue),
  WorkBenchPreCardEntity("assets/icons/ic_clock.svg", "预约评估"),
  WorkBenchPreCardEntity("assets/icons/ic_appoint_doc.svg", "待运动评估"),
  WorkBenchPreCardEntity("assets/icons/ic_circle_yes.svg", "已完成评估"),
  WorkBenchPreCardEntity("assets/icons/ic_exclamation_mark.svg", "预约超时作废"),
];

List<WorkBenchPreCardEntity> sportRecpieList = [
  WorkBenchPreCardEntity("assets/icons/ic_add_circle_tran.svg", "快速建档",
      hasData: false, bgColor: Colors.blue),
  WorkBenchPreCardEntity("assets/icons/ic_clock.svg", "待开处方"),
  WorkBenchPreCardEntity("assets/icons/ic_circle_yes.svg", "已开处方"),
];

List<WorkBenchPreCardEntity> reSportList = [
  WorkBenchPreCardEntity("assets/icons/ic_add_circle_tran.svg", "快速建档",
      hasData: false, bgColor: Colors.blue),
  WorkBenchPreCardEntity("assets/icons/ic_clock.svg", "预约首次康复"),
  WorkBenchPreCardEntity("assets/icons/ic_appoint_doc.svg", "待首次康复"),
  WorkBenchPreCardEntity("assets/icons/ic_circle_yes.svg", "已完成"),
  WorkBenchPreCardEntity("assets/icons/ic_exclamation_mark.svg", "预约超时作废"),
  WorkBenchPreCardEntity("assets/icons/ic_clock.svg", "预约后续康复"),
  WorkBenchPreCardEntity("assets/icons/ic_appoint_doc.svg", "待后续康复运动"),
];
