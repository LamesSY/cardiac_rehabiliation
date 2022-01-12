import 'package:cardiac_rehabilitation/pages/patient_manage/page_add_patient.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/page_patient_manage.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/page_update_patient.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/department_manager.dart';
import 'package:cardiac_rehabilitation/pages/system_manage/manage_manager_card.dart';
import 'package:get/get.dart';

class Routes {
  static const managerManage = '/manage_manager';
  static const managerDep = '/department_manager';

  static const patientManage = '/patient_manage';
  static const addPatient = '/patient_manage/add_patient';
  static const updatePatient = '/patient_manage/update_patient';

  static final pages = [
    GetPage(name: managerManage, page: () => const ManageManagerCard()),
    GetPage(name: managerDep, page: () => const DepManageDashboard()),
    GetPage(name: patientManage, page: () => const PatientManage()),
    GetPage(name: addPatient, page: () => const AddPatient()),
    GetPage(name: updatePatient, page: () => const UpdatePatientPage()),
  ];
}
