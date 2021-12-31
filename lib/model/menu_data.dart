import 'package:cardiac_rehabilitation/constants.dart';

class MenuInfo {
  final String leading, title;
  final List<SubMenuInfo> subMenuList;

  MenuInfo({
    this.leading = "assets/icons/ic_Dashboard.svg",
    this.title,
    this.subMenuList,
  });
}

class SubMenuInfo {
  final String subTitle;
  final PageFlag flag;
  SubMenuInfo(this.subTitle, this.flag);
}

List<MenuInfo> menus = [
  MenuInfo(title: "系统管理", subMenuList: manageSubMenus),
  MenuInfo(title: "工作台", subMenuList: workSubMenus),
  MenuInfo(title: "患者管理"),
  MenuInfo(title: "康复预约", subMenuList: appointmentSubMenus),
  MenuInfo(title: "康复排班", subMenuList: schedulingSubMenus),
];

List<SubMenuInfo> manageSubMenus = [
  SubMenuInfo("管理员管理", PageFlag.manageManager),
  SubMenuInfo("科室管理", PageFlag.manageDep),
];

List<SubMenuInfo> workSubMenus = [
  SubMenuInfo("运动评估", PageFlag.sportAssess),
  SubMenuInfo("运动处方", PageFlag.sportMethod),
  SubMenuInfo("康复运动", PageFlag.reSport),
];

List<SubMenuInfo> appointmentSubMenus = [
  SubMenuInfo("运动预约评估", PageFlag.appointSportAssess),
  SubMenuInfo("康复运动预约", PageFlag.appointReSport),
];

List<SubMenuInfo> schedulingSubMenus = [
  SubMenuInfo("运动评估排班", PageFlag.sportAssessPlan),
  SubMenuInfo("康复运动排班", PageFlag.reSportPlan),
];
