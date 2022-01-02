import 'package:flutter/material.dart';

class SearchInputField {
  final String title;
  final IconData iconData;
  SearchInputField({
    @required this.title,
    this.iconData,
  });
}

List<SearchInputField> searchInputList = [
  SearchInputField(title: "用户名称"),
  SearchInputField(title: "手机号"),
  SearchInputField(title: "状态", iconData: Icons.keyboard_arrow_down),
  SearchInputField(title: "角色", iconData: Icons.keyboard_arrow_down),
  SearchInputField(title: "科室", iconData: Icons.keyboard_arrow_down),
];
