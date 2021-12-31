import 'package:flutter/material.dart';

class SportAccessEntity {
  final String svgSrc, subTitle;
  final bool hasData;
  final Color bgColor;
  SportAccessEntity(this.svgSrc, this.subTitle,
      {this.hasData = true, this.bgColor = Colors.white});
}

List<SportAccessEntity> sportAccessList = [
  SportAccessEntity("assets/icons/ic_add_circle_tran.svg", "快速建档",
      hasData: false, bgColor: Colors.blue),
  SportAccessEntity("assets/icons/ic_clock.svg", "预约评估"),
  SportAccessEntity("assets/icons/ic_appoint_doc.svg", "待运动评估"),
  SportAccessEntity("assets/icons/ic_circle_yes.svg", "已完成评估"),
  SportAccessEntity("assets/icons/ic_exclamation_mark.svg", "预约超时作废"),
];
