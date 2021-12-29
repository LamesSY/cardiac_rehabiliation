import 'package:cardiac_rehabilitation/constants.dart';
import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  PageFlag _flag = PageFlag.none;

  PageFlag get flag => _flag;

  void changePage(PageFlag flag) {
    _flag = flag;
  }
}
