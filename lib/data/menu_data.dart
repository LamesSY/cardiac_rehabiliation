import 'package:cardiac_rehabilitation/routes/route_manage.dart';

class MenuInfo {
  final String leading, title;
  final List<SubMenuInfo>? subMenuList;

  MenuInfo({
    this.leading = "assets/icons/ic_Dashboard.svg",
    this.title = "",
    this.subMenuList,
  });
}

class SubMenuInfo {
  final String subTitle;
  final String routeName;
  SubMenuInfo(this.subTitle, this.routeName);
}

List<MenuInfo> menus = [
  MenuInfo(title: "系统管理", subMenuList: manageSubMenus),
  MenuInfo(title: "工作台", subMenuList: workSubMenus),
  MenuInfo(title: "患者管理"),
  MenuInfo(title: "预约", subMenuList: appointmentSubMenus),
  MenuInfo(title: "康复排班", subMenuList: schedulingSubMenus),
];

List<SubMenuInfo> manageSubMenus = [
  SubMenuInfo("管理员管理", Routes.managerManage),
  SubMenuInfo("科室管理", Routes.managerDep),
];

List<SubMenuInfo> workSubMenus = [
  SubMenuInfo("运动评估", Routes.sportAccess),
  SubMenuInfo("运动处方", Routes.managerDep),
  SubMenuInfo("康复运动", Routes.sportRecipe),
];

List<SubMenuInfo> appointmentSubMenus = [
  SubMenuInfo("运动预约评估", Routes.appointSport),
  SubMenuInfo("康复运动预约", Routes.appointRe),
];

List<SubMenuInfo> schedulingSubMenus = [
  SubMenuInfo("运动评估排班", Routes.managerDep),
  SubMenuInfo("康复运动排班", Routes.managerDep),
];
