import 'package:cardiac_rehabilitation/controllers/dashboard_controller.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/department_manager.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/manage_manager_card.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/sport_access.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (context, notifer, child) {
      switch (notifer.flag) {
        case PageFlag.manageManager:
          return const ManageManagerCard();
          break;
        case PageFlag.manageDep:
          return const DepManageDashboard();
          break;
        case PageFlag.sportAssess:
          return const SportAccess();
          break;
        default:
          return const ManageManagerCard();
      }
    });
  }
}
