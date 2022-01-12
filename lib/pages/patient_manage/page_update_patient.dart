import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/logic/logic_edit_patient.dart';
import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:cardiac_rehabilitation/network/dio_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page_add_patient.dart';

class UpdatePatientPage extends StatelessWidget {
  const UpdatePatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PatientInfoEditLogic logic = Get.put(PatientInfoEditLogic());
    final patientInfo = Get.arguments['detail'] as PatientDetailInfo;
    final duid = Get.arguments['diod'] as String;
    GlobalKey _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          decoration: cirBoxDecoration(radius: 20),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "患者建档",
                    style: TextStyle(inherit: false, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: dividerColor),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 22,
                        margin: const EdgeInsets.only(right: 8),
                        decoration:
                            cirBoxDecoration(radius: 2, color: Colors.blue),
                      ),
                      const Text("基础信息"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InputContainer(
                        "患者姓名",
                        initialValue: patientInfo.userName,
                        onContentSave: (content) => logic.userName = content,
                        checkContent: (content) =>
                            content == null || content.isEmpty
                                ? "患者姓名不能为空"
                                : null,
                        isRequired: true,
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "患者ID",
                        initialValue: patientInfo.uid,
                        onContentSave: (content) => logic.uid = content,
                        checkContent: (content) =>
                            content == null || content.isEmpty
                                ? "患者ID不能为空"
                                : null,
                        isRequired: true,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text.rich(TextSpan(children: [
                    TextSpan(text: "性别"),
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ])),
                  const SizedBox(height: 4),
                  GetBuilder<PatientInfoEditLogic>(
                    id: 'genderChoose',
                    builder: (_) => Row(
                      children: [
                        GenderSelectButton(
                          1,
                          "images/male.png",
                          logic.genderFlag.value == 1,
                          onCLick: () => logic.changeFocus(1),
                        ),
                        const SizedBox(width: 10),
                        GenderSelectButton(
                          0,
                          "images/female.png",
                          logic.genderFlag.value == 0,
                          onCLick: () => logic.changeFocus(0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InputContainer(
                        "出生日期",
                        initialValue: patientInfo.birthday,
                        onContentSave: (content) => logic.birthday = content,
                        checkContent: (content) =>
                            content == null || content.isEmpty
                                ? "出生日期不能为空"
                                : null,
                        isRequired: true,
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "身高",
                        initialValue: patientInfo.height.toString(),
                        onContentSave: (content) {},
                        checkContent: (content) {},
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "体重",
                        initialValue: patientInfo.weight.toString(),
                        onContentSave: (content) {},
                        checkContent: (content) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InputContainer(
                        "联系电话",
                        initialValue: patientInfo.phone,
                        onContentSave: (content) {},
                        checkContent: (content) {
                          if (content == null || content.isEmpty) return null;
                          return content.isPhoneNumber ? null : "请输入正确的号码格式";
                        },
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "居住地",
                        initialValue: patientInfo.address,
                        onContentSave: (content) {},
                        checkContent: (content) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(color: dividerColor),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 22,
                        margin: const EdgeInsets.only(right: 8),
                        decoration:
                            cirBoxDecoration(radius: 2, color: Colors.blue),
                      ),
                      const Text("住院信息"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const DropDownInputContainer(
                        "状态",
                        dropdowItems: [
                          DropdownMenuItem(child: Text("已结束"), value: 0),
                          DropdownMenuItem(child: Text("待评估预约"), value: 1),
                          DropdownMenuItem(child: Text("待评估"), value: 2),
                          DropdownMenuItem(child: Text("待开方"), value: 3),
                          DropdownMenuItem(child: Text("待康复预约"), value: 4),
                          DropdownMenuItem(child: Text("待康复记录"), value: 5),
                        ],
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "临床诊断",
                        onContentSave: (content) {},
                        checkContent: (content) {},
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "服药情况",
                        onContentSave: (content) {},
                        checkContent: (content) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InputContainer("入院日期",
                          initialValue: patientInfo.startTime,
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                      const SizedBox(width: 70),
                      InputContainer("住院号",
                          initialValue: patientInfo.hospitalNumber,
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                      const SizedBox(width: 70),
                      InputContainer("床号",
                          initialValue: patientInfo.bedNo.toString(),
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                      const SizedBox(width: 70),
                      InputContainer("出院日期",
                          initialValue: patientInfo.endTime,
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("NYHA分级"),
                  const SizedBox(height: 10),
                  GetBuilder<PatientInfoEditLogic>(
                    id: 'nyha_level',
                    init: PatientInfoEditLogic(),
                    builder: (_) => Row(
                      children: [
                        LevelSelectChip(1, logic.nyhaLevel.value == 1),
                        const SizedBox(width: 40),
                        LevelSelectChip(2, logic.nyhaLevel.value == 2),
                        const SizedBox(width: 40),
                        LevelSelectChip(3, logic.nyhaLevel.value == 3),
                        const SizedBox(width: 40),
                        LevelSelectChip(4, logic.nyhaLevel.value == 4),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("主要诊断"),
                  const SizedBox(height: 4),
                  const ChipsBox("选择疾病"),
                  const SizedBox(height: 20),
                  const Text("服用药物"),
                  const SizedBox(height: 4),
                  const ChipsBox("选择药物"),
                  const SizedBox(height: 40),
                  const Divider(color: dividerColor),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        style: radiusStyle(10),
                        onPressed: () async {
                          var formState = _formKey.currentState as FormState;
                          if (formState.validate()) {
                            formState.save();
                            var result = await addOrUpdatePatient(
                              duid: duid,
                              userName: logic.userName!,
                              uid: logic.uid!,
                              gender: logic.genderFlag.value,
                              birthday: logic.birthday!,
                              status: logic.status,
                              nyhaLevel: logic.nyhaLevel.value,
                              address: logic.address,
                              height: logic.height,
                              weight: logic.weight,
                              phone: logic.phone,
                              clinicalDiagnosis: logic.clinicalDiagnosis,
                              medication: logic.medication,
                              startTime: logic.startTime,
                              hospitalNumber: logic.hospitalNumber,
                              bedNo: logic.bedNo,
                              endTime: logic.endTime,
                              hospitalDiseaseVos: logic.hospitalDiseaseVos,
                              drugDuids: logic.drugDuids,
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 28),
                          child: Text("提交"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        style: radiusStyle(10),
                        onPressed: () => Get.back(),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 28),
                          child: Text("取消"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
