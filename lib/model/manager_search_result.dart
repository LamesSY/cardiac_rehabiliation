class ManagerInfo {
  final int userId;
  final String name, phoneNum, dep, role, date, status;

  ManagerInfo({
    this.userId,
    this.name,
    this.phoneNum,
    this.dep,
    this.role,
    this.date,
    this.status,
  });
}

List<String> tableHead = [
  "用户编号",
  "用户名称",
  "手机号",
  "科室",
  "角色",
  "创建日期",
  "状态",
  "操作"
];

List<ManagerInfo> managerList = [
  ManagerInfo(
      userId: 0,
      name: "王佳佳",
      phoneNum: "13842153404",
      dep: "心血管科",
      role: "医生",
      date: "2021-12-12",
      status: "禁用"),
  ManagerInfo(
      userId: 1,
      name: "里精明",
      phoneNum: "1384212344",
      dep: "脑科",
      role: "医生",
      date: "2021-12-12",
      status: "启用"),
  ManagerInfo(
      userId: 2,
      name: "王磊",
      phoneNum: "13842123534",
      dep: "儿科",
      role: "医生",
      date: "2021-12-12",
      status: "禁用"),
  ManagerInfo(
      userId: 3,
      name: "刘主任",
      phoneNum: "13352533004",
      dep: "五官科",
      role: "医生",
      date: "2021-12-12",
      status: "启用"),
];
