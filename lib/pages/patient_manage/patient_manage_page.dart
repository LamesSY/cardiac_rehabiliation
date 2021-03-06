import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/logic/patient_list_logic.dart';
import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:cardiac_rehabilitation/network/patient_manage_dio.dart';
import 'package:cardiac_rehabilitation/routes/route_manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientManagePage extends StatelessWidget {
  PatientManagePage({Key? key}) : super(key: key);

  final logic = Get.put(PatientListLogic());
  final state = Get.find<PatientListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return PatientManageLayout(
      children: [
        const Text("患者管理", style: TextStyle(fontSize: 18)),
        const SizedBox(height: 15),
        //新增按钮
        AddButton(onPress: () => Get.toNamed(Routes.addPatient)),
        //搜索框布局
        PatientSearchInputCard(
          patientStatus: state.patientStatus,
          onPress: () => logic.refreshList(1),
        ),
        //表头
        const TableHead(),
        //表数据
        GetBuilder<PatientListLogic>(
          builder: (_) => TableData(state.patientSummary.records ?? []),
        ),
        //底部页数跳转
        GetBuilder<PatientListLogic>(
          builder: (_) => TableBottom(
            state.currentPage,
            state.pages,
            onlastPage: () => logic.refreshList(state.currentPage - 1),
            onNextPage: () => logic.refreshList(state.currentPage + 1),
            onAssignPage: (page) => logic.refreshList(page),
          ),
        )
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      icon: const Icon(Icons.add),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
        child: Text("添加患者"),
      ),
    );
  }
}

class PatientManageLayout extends StatelessWidget {
  const PatientManageLayout({Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------
class TableBottom extends StatelessWidget {
  const TableBottom(
    this.currentPage,
    this.pageNum, {
    Key? key,
    required this.onlastPage,
    required this.onNextPage,
    required this.onAssignPage,
  }) : super(key: key);

  final int pageNum;
  final int currentPage;

  final VoidCallback onlastPage;
  final VoidCallback onNextPage;
  final Function(int) onAssignPage;

  List getPages(int pageNum) {
    return List.generate(pageNum,
        (index) => TextButton(onPressed: () {}, child: Text("${index + 1}")));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cirBoxDecoration(),
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: List.generate(
          pageNum + 2,
          (index) {
            if (index == 0) {
              return IconButton(
                icon: const Icon(Icons.keyboard_arrow_left, color: Colors.grey),
                onPressed: currentPage <= 1 ? null : onlastPage,
              );
            } else if (index == pageNum + 1) {
              return IconButton(
                icon:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onPressed: currentPage >= pageNum ? null : onNextPage,
              );
            } else {
              return TextButton(
                onPressed: () => onAssignPage(index),
                child: Text(
                  "$index",
                  style: TextStyle(
                    color: index == currentPage ? Colors.blue : Colors.black,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class TableData extends StatelessWidget {
  const TableData(
    this.list, {
    Key? key,
  }) : super(key: key);

  List<PopupMenuItem<int>> getItems(PatientInfo info) {
    return [
      PopupMenuItem<int>(child: const Text("编辑"), value: 0, onTap: () {}),
      PopupMenuItem<int>(child: const Text("历史运动评估"), value: 1, onTap: () {}),
      PopupMenuItem<int>(child: const Text("历史运动处方"), value: 3, onTap: () {}),
      PopupMenuItem<int>(child: const Text("历史运动记录"), value: 4, onTap: () {}),
      PopupMenuItem<int>(
        child: const Text(
          "删除",
          style: TextStyle(color: Colors.red),
        ),
        value: 5,
        onTap: () async {
          var duid = info.duid;
          if (duid == null || duid.isEmpty) return;
          var result = await deletePatient(duid);
          if (result) Get.find<PatientListLogic>().refreshList(1);
        },
      ),
    ];
  }

  Text getText(int state) {
    switch (state) {
      case 0:
        return const Text("已结束", style: TextStyle(color: Colors.green));
      case 1:
        return const Text("待评估预约", style: TextStyle(color: Colors.red));
      case 2:
        return const Text("待评估", style: TextStyle(color: Colors.orange));
      case 3:
        return const Text("待开方", style: TextStyle(color: Colors.orange));
      case 4:
        return const Text("待康复预约", style: TextStyle(color: Colors.red));
      case 5:
        return const Text("待康复记录", style: TextStyle(color: Colors.orange));
      default:
        return const Text("已结束", style: TextStyle(color: Colors.green));
    }
  }

  final List<PatientInfo> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: cirBoxDecoration(),
          padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
          margin: const EdgeInsets.only(bottom: 10),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 16),
            child: Row(
              children: [
                Expanded(flex: 10, child: Text(list[index].userName ?? "")),
                Expanded(flex: 10, child: Text(list[index].uid ?? "")),
                Expanded(
                    flex: 6, child: Text(list[index].sex == 0 ? "女" : "男")),
                Expanded(flex: 6, child: Text("${list[index].age}")),
                Expanded(flex: 12, child: Text(list[index].phone ?? "")),
                Expanded(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      label: Text(
                        list[index].disease!.isEmpty
                            ? ""
                            : "${list[index].disease?[0]}",
                        style: const TextStyle(color: Colors.blue),
                      ),
                      backgroundColor: list[index].disease!.isEmpty
                          ? Colors.white
                          : Colors.blue.shade100,
                    ),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Text(
                        list[index].nyha == null ? "" : "${list[index].nyha}")),
                Expanded(
                    flex: 12,
                    child: Text(list[index].startTime?.substring(0, 16) ?? "")),
                Expanded(
                    flex: 10, child: Text("${list[index].evaluateNumber}")),
                Expanded(
                    flex: 10, child: getText(list[index].state?.toInt() ?? 0)),
                Expanded(
                  flex: 16,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("详情"),
                      ),
                      PopupMenuButton(
                        tooltip: "",
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        itemBuilder: (context) => getItems(list[index]),
                        icon: const Icon(Icons.more_horiz),
                        onSelected: (value) async {
                          if (value != 0) return;
                          var duid = list[index].duid;
                          if (duid == null || duid.isEmpty) return;
                          var detailInfo = await getPatientDetailInfo(duid);
                          Get.toNamed(Routes.updatePatient,
                              arguments: {'duid': duid, 'detail': detailInfo});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TableHead extends StatelessWidget {
  const TableHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cirBoxDecoration(color: tableHeadBgColor),
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        child: Row(
          children: const [
            Expanded(flex: 10, child: Text("患者姓名")),
            Expanded(flex: 10, child: Text("患者ID")),
            Expanded(flex: 6, child: Text("性别")),
            Expanded(flex: 6, child: Text("年龄")),
            Expanded(flex: 12, child: Text("手机号")),
            Expanded(flex: 10, child: Text("主要诊断")),
            Expanded(flex: 10, child: Text("NYHA分级")),
            Expanded(flex: 12, child: Text("入院日期")),
            Expanded(flex: 10, child: Text("评估次数")),
            Expanded(flex: 10, child: Text("状态")),
            Expanded(flex: 16, child: Text("操作")),
          ],
        ),
      ),
    );
  }
}

class PatientSearchInputCard extends StatelessWidget {
  const PatientSearchInputCard({
    Key? key,
    required this.patientStatus,
    required this.onPress,
  }) : super(key: key);

  final List<DropdownMenuItem<int>> patientStatus;

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    GlobalKey _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 23),
      margin: const EdgeInsets.only(top: 15),
      decoration: cirBoxDecoration(radius: 10, color: Colors.white),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 16),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: [
                    OutlineInputField(
                      leftTip: "患者姓名",
                      onSave: (content) =>
                          PatientListLogic.to.state.userName = content,
                    ),
                    OutlineInputField(
                      leftTip: "患者ID",
                      onSave: (content) =>
                          PatientListLogic.to.state.uid = content,
                    ),
                    OutlineInputField(
                      leftTip: "手机号",
                      onSave: (content) =>
                          PatientListLogic.to.state.phone = content,
                    ),
                    DropdownInputField("患者状态", 0, patientStatus),
                    DropdownInputField("主要诊断", 0, patientStatus),
                    DropdownInputField("入院时间", 0, patientStatus),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    var formState = _formKey.currentState as FormState;
                    formState.save();
                    PatientListLogic.to.refreshList(1);
                    //  onPress;
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("搜索"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownInputField extends StatelessWidget {
  const DropdownInputField(this.title, this.value, this.dropdowItems,
      {Key? key})
      : super(key: key);

  final String title;
  final int value;
  final List<DropdownMenuItem<int>> dropdowItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 240,
        child: DropdownButtonFormField(
          value: 0,
          icon: const Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
            icon: Text(title),
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0.1),
            ),
          ),
          items: dropdowItems,
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class OutlineInputField extends StatelessWidget {
  const OutlineInputField({
    Key? key,
    this.leftTip,
    required this.onSave,
  }) : super(key: key);

  final String? leftTip;
  final Function(String?) onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 240,
        child: TextFormField(
          decoration: InputDecoration(
            icon: leftTip == null ? null : Text(leftTip!),
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0.1, color: Colors.grey.shade100),
            ),
          ),
          onSaved: onSave,
        ),
      ),
    );
  }
}
