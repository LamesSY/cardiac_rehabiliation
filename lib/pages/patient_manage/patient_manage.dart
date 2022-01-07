import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/logic/dashboard_controller.dart';
import 'package:cardiac_rehabilitation/logic/patient_list_controller.dart';
import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:cardiac_rehabilitation/network/dio_manager.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PatientManage extends StatelessWidget {
  const PatientManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PatientListController());
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("患者管理", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  //Get.dialog(DiaLogAddDep());
                  context
                      .read<DashboardController>()
                      .changePage(PageFlag.addPatient);
                },
                icon: const Icon(Icons.add),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                  child: Text("添加患者"),
                ),
              ),
              PatientSearchInputCard(),
              const TableHead(),
              //TableData(),
              Obx(() => TableData(logic.summary.value)),
              const TableBottom()
            ],
          ),
        ),
      ),
    );
  }
}

class TableBottom extends StatelessWidget {
  const TableBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cirBoxDecoration(),
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left, color: Colors.grey),
            onPressed: () {},
          ),
          TextButton(
            child: Text("1"),
            onPressed: () {},
          ),
          TextButton(
            child: Text("2"),
            onPressed: () {},
          ),
          TextButton(
            child: Text("3"),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TableData extends StatelessWidget {
  const TableData(
    this.summary, {
    Key? key,
  }) : super(key: key);
  static const moreFunList = [
    PopupMenuItem(child: Text("编辑"), value: 0),
    PopupMenuItem(child: Text("历史运动评估"), value: 1),
    PopupMenuItem(child: Text("历史运动处方"), value: 3),
    PopupMenuItem(child: Text("历史运动记录"), value: 4),
    PopupMenuItem(
        child: Text(
          "删除",
          style: TextStyle(color: Colors.red),
        ),
        value: 5),
  ];

  final PatientInfoSummary summary;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: summary.records?.length ?? 0,
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
                Expanded(
                    flex: 10,
                    child: Text(summary.records?[index].userName ?? "FF")),
                Expanded(
                    flex: 10,
                    child: Text(summary.records?[index].uid ?? "1111")),
                Expanded(
                    flex: 6, child: Text("${summary.records?[index].sex}")),
                Expanded(
                    flex: 6, child: Text("${summary.records?[index].age}")),
                Expanded(
                    flex: 12,
                    child: Text(summary.records?[index].phone ?? "2222")),
                Expanded(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      label: Text(summary.records![index].disease!.isEmpty
                          ? ""
                          : "${summary.records?[index].disease?[0]}"),
                      backgroundColor: Colors.blue.shade100,
                    ),
                  ),
                ),
                Expanded(
                    flex: 10, child: Text("${summary.records?[index].nyha}")),
                Expanded(
                    flex: 12,
                    child: Text(summary.records?[index].startTime ?? "2012")),
                Expanded(flex: 10, child: Text("2")),
                Expanded(
                    flex: 10,
                    child: Text("待评估", style: TextStyle(color: Colors.red))),
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
                        itemBuilder: (context) => moreFunList,
                        icon: const Icon(Icons.more_horiz),
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
  }) : super(key: key);

  static const List<DropdownMenuItem<int>> patientStatus = [
    DropdownMenuItem(child: Text("全部"), value: 0),
    DropdownMenuItem(child: Text("待评估"), value: 1),
    DropdownMenuItem(child: Text("已评估"), value: 2),
  ];

  //final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 23),
      margin: const EdgeInsets.only(top: 15),
      decoration: cirBoxDecoration(radius: 10, color: Colors.white),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 16),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Wrap(
                spacing: 15,
                runSpacing: 10,
                children: const [
                  OutlineInputField(leftTip: "患者姓名"),
                  OutlineInputField(leftTip: "患者ID"),
                  OutlineInputField(leftTip: "手机号"),
                  DropdownInputField("患者状态", 0, patientStatus),
                  DropdownInputField("主要诊断", 0, patientStatus),
                  DropdownInputField("入院时间", 0, patientStatus),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  var summary = await getPatientList(1, 10);
                  Get.find<PatientListController>().refreshPatientList(summary);
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
  }) : super(key: key);

  final String? leftTip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 240,
        child: TextField(
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
        ),
      ),
    );
  }
}
