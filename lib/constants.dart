import 'package:flutter/material.dart';

const appTitle = "mAFAIII";

const defaultPadding = 15.0;

const bgColor = Colors.white;

const appBarHeight = 55.0;

const primaryTextFontSize = 16.0;

const dashBoardBgColor = Color(0xFFF6F6F6);

BoxDecoration cirBoxDecoration(
    {double radius = 10, Color color = Colors.white}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: color,
  );
}

enum PageFlag {
  none,
  manageManager,
  manageDep,
  sportAssess,
  sportMethod,
  managePatient,
  reSport,
  appointSportAssess,
  appointReSport,
  sportAssessPlan,
  reSportPlan,
}
