import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:flutter/material.dart';

class PatientManageState {
  late PatientInfoSummary patientSummary;
  late int currentPage;
  late int pages;

  String? disease;
  int? fieldIndex;
  String? phone;
  String? startDate;
  int? status;
  String? uid;
  String? userName;

  final List<DropdownMenuItem<int>> patientStatus = [
    const DropdownMenuItem(child: Text("全部"), value: 0),
    const DropdownMenuItem(child: Text("待评估"), value: 1),
    const DropdownMenuItem(child: Text("已评估"), value: 2),
  ];

  PatientManageState() {
    patientSummary = PatientInfoSummary();
    currentPage = 1;
    pages = 1;
  }
}
