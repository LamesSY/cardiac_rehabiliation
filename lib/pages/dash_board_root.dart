import 'package:cardiac_rehabilitation/controllers/dashboard_controller.dart';
import 'package:cardiac_rehabilitation/pages/appoint_rehabilitation/sport_access_appointment.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/add_patient.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/patient_manage.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/department_manager.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/manage_manager_card.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/sport_access.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/sport_recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (context, notifer, child) {
      switch (notifer.flag) {
        case PageFlag.manageManager:
          return ManageManagerCard();
          break;
        case PageFlag.manageDep:
          return DepManageDashboard();
          break;
        case PageFlag.sportAssess:
          return SportAccess();
          break;
        case PageFlag.sportRecipe:
          return SportRecipe();
          break;
        case PageFlag.managePatient:
          return PatientManage();
          break;
        case PageFlag.appointSportAssess:
          return SportAccessAppointment();
          break;
        case PageFlag.addPatient:
          return const AddPatient();
          break;
        default:
          return const AddPatient();
      }
    });
  }
}
