import 'package:cardiac_rehabilitation/pages/appoint_rehabilitation/rehabilitation_appoint_page.dart';
import 'package:cardiac_rehabilitation/pages/appoint_rehabilitation/sport_access_appoint_page.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/add_patient_page.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/patient_manage_page.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/update_patient_page.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/department_manage_page.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/manager_manage_page.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/sport_access_page.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/sport_recipe_page.dart';
import 'package:get/get.dart';

class Routes {
  static const managerManage = '/manage_manager';
  static const managerDep = '/department_manager';

  static const sportAccess = '/sport_assess';
  static const sportRecipe = '/sport_recipe';

  static const patientManage = '/patient_manage';
  static const addPatient = '/patient_manage/add_patient';
  static const updatePatient = '/patient_manage/update_patient';

  static const appointSport = '/appoint_sport';
  static const appointRe = '/appoint_recipe';

  static final pages = [
    GetPage(name: managerManage, page: () => const ManageManagerPage()),
    GetPage(name: managerDep, page: () => const DepManagePage()),
    GetPage(name: patientManage, page: () => const PatientManagePage()),
    GetPage(name: addPatient, page: () => const AddPatientPage()),
    GetPage(name: updatePatient, page: () => const UpdatePatientPage()),
    GetPage(name: sportAccess, page: () => const SportAccessPage()),
    GetPage(name: sportRecipe, page: () => const SportRecipePage()),
    GetPage(name: appointSport, page: () => const SportAccessAppointPage()),
    GetPage(name: appointRe, page: () => const RehabiliationAppointPage()),
  ];
}
