import 'package:cardiac_rehabilitation/pages/patient_manage/patient_manage.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/department_manager.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/manage_manager_card.dart';
import 'package:get/get.dart';

class Routes {
  static const managerManage = '/manage_manager';
  static const managerDep = '/department_manager';

  static const patientManage = '/patient_manage';

  static final pages = [
    GetPage(name: managerManage, page: () => ManageManagerCard()),
    GetPage(name: managerDep, page: () => DepManageDashboard()),
    GetPage(name: patientManage, page: () => PatientManage()),
  ];

  static final routeNames = [
    Routes.managerManage,
    Routes.managerDep,
    Routes.patientManage
  ];
}
