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
  SearchInputField(title: "状态", iconData: Icons.arrow_drop_down_rounded),
  SearchInputField(title: "角色", iconData: Icons.arrow_drop_down_rounded),
  SearchInputField(title: "科室", iconData: Icons.arrow_drop_down_rounded),
];

List<String> ResultTableHead = [
  "用户编号",
  "用户名称",
  "手机号",
  "科室",
  "角色",
  "创建日期",
  "状态",
  "操作"
];
