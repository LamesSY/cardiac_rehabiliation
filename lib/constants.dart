import 'package:logger/logger.dart';

const appTitle = "mAFAIII";

final logger = Logger();

enum PageFlag {
  none,
  manageManager,
  manageDep,
  sportAssess,
  sportRecipe,
  managePatient,
  reSport,
  appointSportAssess,
  appointReSport,
  sportAssessPlan,
  reSportPlan,

  addPatient
}
