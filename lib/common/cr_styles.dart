import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:flutter/material.dart';

const double defaultPadding = 15;

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

InputDecoration inputBoxDecoration({
  Widget? title,
  Widget? prefixIcon,
  required String hintText,
  double radius = 10,
  Color color = inputBorderColor,
}) {
  return InputDecoration(
    icon: title,
    //label: Icon(Icons.calendar_today),
    prefixIcon: prefixIcon,
    isCollapsed: true,
    contentPadding: const EdgeInsets.all(15),
    hintText: hintText,
    hintStyle: const TextStyle(inherit: true, fontSize: 14),
    border: OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(width: 0.1, color: color),
    ),
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
