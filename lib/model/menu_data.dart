class MenuInfo {
  final String leading, title;
  final List<SubMenuInfo> subMenuList;

  MenuInfo({
    this.leading = "icons/ic_Dashboard.svg",
    this.title,
    this.subMenuList,
  });
}

class SubMenuInfo {
  final String subTitle;
  SubMenuInfo({this.subTitle});
}

List<MenuInfo> menus = [
  MenuInfo(title: "系统管理", subMenuList: manageSubMenus),
  MenuInfo(title: "工作台", subMenuList: workSubMenus),
  MenuInfo(title: "患者管理"),
  MenuInfo(title: "康复预约", subMenuList: appointmentSubMenus),
  MenuInfo(title: "康复排班", subMenuList: schedulingSubMenus),
];

List<SubMenuInfo> manageSubMenus = [
  SubMenuInfo(subTitle: "管理员管理"),
  SubMenuInfo(subTitle: "科室管理"),
];

List<SubMenuInfo> workSubMenus = [
  SubMenuInfo(subTitle: "运动评估"),
  SubMenuInfo(subTitle: "运动处方"),
  SubMenuInfo(subTitle: "康复运动"),
];

List<SubMenuInfo> appointmentSubMenus = [
  SubMenuInfo(subTitle: "运动预约评估"),
  SubMenuInfo(subTitle: "康复运动预约"),
];

List<SubMenuInfo> schedulingSubMenus = [
  SubMenuInfo(subTitle: "运动评估排班"),
  SubMenuInfo(subTitle: "康复运动排班"),
];
