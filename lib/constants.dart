import 'package:flutter/material.dart';

const appTitle = "mAFAIII";

const defaultPadding = 15.0;

const bgColor = Colors.white;

const dividerColor = Color(0XFFE2E2EA);

const appBarHeight = 55.0;

const primaryTextFontSize = 16.0;

const dashBoardBgColor = Color(0xFFF6F6F6);

ButtonStyle radiusStyle(double radius) {
  return ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))));
}

BoxDecoration cirBoxDecoration(
    {double radius = 10, Color color = Colors.white}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: color,
  );
}

InputDecoration inputWithBorder = InputDecoration(
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(15),
  border: OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 0.1, color: Colors.grey.shade100),
  ),
);

InputDecoration inputWithBorderSelection = InputDecoration(
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(15),
  suffixIcon: const Icon(Icons.keyboard_arrow_down),
  border: OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 0.1, color: Colors.grey.shade100),
  ),
);

enum PageFlag {
  none,
  manageManager,
  manageDep,
  sportAssess,
  sportRecipe,
  managePatient,
  reSport,
  appointSportAssess,
  appointReSport,
  sportAssessPlan,
  reSportPlan,
}
