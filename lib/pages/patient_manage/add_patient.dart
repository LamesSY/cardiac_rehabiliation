import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/logic/logic_add_patient.dart';
import 'package:cardiac_rehabilitation/network/dio_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddPatientLogic logic = Get.put(AddPatientLogic());
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
                  GetBuilder<AddPatientLogic>(
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
                        onContentSave: (content) {},
                        checkContent: (content) {},
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "体重",
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
                        onContentSave: (content) {},
                        checkContent: (content) {
                          if (content == null || content.isEmpty) return null;
                          return content.isPhoneNumber ? null : "请输入正确的号码格式";
                        },
                      ),
                      const SizedBox(width: 70),
                      InputContainer(
                        "居住地",
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
                      // InputContainer("状态",
                      //     onContentSave: (content) {},
                      //     checkContent: (content) {},
                      //     isRequired: true),
                      //状态 0：已结束 1：待评估预约 2：待评估 3：待开方 4：待康复预约 5：待康复记录
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
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                      const SizedBox(width: 70),
                      InputContainer("住院号",
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                      const SizedBox(width: 70),
                      InputContainer("床号",
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                      const SizedBox(width: 70),
                      InputContainer("出院日期",
                          onContentSave: (content) {},
                          checkContent: (content) {}),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("NYHA分级"),
                  const SizedBox(height: 10),
                  GetBuilder<AddPatientLogic>(
                    id: 'nyha_level',
                    init: AddPatientLogic(),
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
                            logger.d(
                                "${logic.userName}\n${logic.uid}\n${logic.nyhaLevel}\n${logic.status}");
                            var result = await addNewPatient(
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

class ChipsBox extends StatelessWidget {
  const ChipsBox(
    this.buttonText, {
    Key? key,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: 380,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              //color: Colors.green,
              border: Border.all(color: inputBorderColor, width: 2)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chip(
                label: Text("冠心病", style: TextStyle(color: Colors.blue)),
                deleteIcon: const Icon(Icons.close, color: Colors.blue),
                onDeleted: () {},
                backgroundColor: Colors.blue.withOpacity(0.1),
              )
            ],
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          style: radiusStyle(10),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
            child: Text(buttonText),
          ),
        )
      ],
    );
  }
}

class LevelSelectChip extends StatelessWidget {
  const LevelSelectChip(
    this.level,
    this.isSelect, {
    Key? key,
  }) : super(key: key);

  final int level;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text("$level级"),
      avatar: const CircleAvatar(backgroundColor: Colors.grey),
      selectedColor: Colors.transparent,
      backgroundColor: Colors.white,
      onSelected: (value) => Get.find<AddPatientLogic>().changeNYHALevel(level),
      selected: isSelect,
    );
  }
}

class GenderSelectButton extends StatelessWidget {
  const GenderSelectButton(this.genderFlag, this.svgUri, this.isSelect,
      {Key? key, this.onCLick})
      : super(key: key);

  final String svgUri;
  final int genderFlag;
  final bool isSelect;
  final VoidCallback? onCLick;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onCLick,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => isSelect ? Colors.blue.shade100 : Colors.white)),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 25, right: 25, bottom: 10),
            child: Image(image: AssetImage(svgUri)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              genderFlag == 0 ? "女" : "男",
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer(
    this.title, {
    Key? key,
    this.isRequired = false,
    required this.onContentSave,
    required this.checkContent,
  }) : super(key: key);

  final String title;
  final bool isRequired;
  final Function(String) onContentSave;
  final String? Function(String?) checkContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: title),
          if (isRequired)
            const TextSpan(text: "*", style: TextStyle(color: Colors.red))
        ])),
        const SizedBox(height: 4),
        SizedBox(
          width: 240,
          child: TextFormField(
              scrollPadding: EdgeInsets.zero,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: inputBoxDecoration(hintText: "请输入..."),
              style: const TextStyle(fontSize: 14),
              validator: (value) => checkContent(value),
              onSaved: (newValue) =>
                  newValue == null ? null : onContentSave(newValue)),
        )
      ],
    );
  }
}

class DropDownInputContainer extends StatelessWidget {
  const DropDownInputContainer(
    this.title, {
    Key? key,
    this.isRequired = false,
    this.value = 0,
    required this.dropdowItems,
  }) : super(key: key);

  final String title;
  final bool isRequired;
  final int value;
  final List<DropdownMenuItem<int>> dropdowItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: title),
          if (isRequired)
            const TextSpan(text: "*", style: TextStyle(color: Colors.red))
        ])),
        const SizedBox(height: 4),
        SizedBox(
          width: 240,
          child: DropdownButtonFormField(
            value: 0,
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                gapPadding: 1,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.1),
              ),
            ),
            items: dropdowItems,
            onChanged: (value) =>
                Get.find<AddPatientLogic>().status = value as int,
          ),
        )
      ],
    );
  }
}
