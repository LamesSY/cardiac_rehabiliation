import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key key}) : super(key: key);

  void getHttpTest() async {
    var token =
        "eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6ImQ0YjE5YzczLTU1ZWMtNDAzNC04MTYwLTVlOWQ5MjczZDliZCJ9.a9xLga-UMCbwp8IgpXq3bY7vonCYSRkTYGOodHsXlo3H3ptbMp0gez1awUhvulexlW8lEUZVL6xAQfpRxO3l4w";
    try {
      var response = await Dio().post('http://120.79.97.39:8899/login',
          data: {"username": "admin", "password": "admin123"});
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          decoration: cirBoxDecoration(radius: 20),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 16),
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
                  children: const [
                    InputContainer("患者姓名", isRequired: true),
                    SizedBox(width: 70),
                    InputContainer("患者ID", isRequired: true)
                  ],
                ),
                const SizedBox(height: 20),
                const Text.rich(TextSpan(children: [
                  TextSpan(text: "性别"),
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    GenderSelectButton("男", "assets/images/male.svg"),
                    SizedBox(width: 10),
                    GenderSelectButton("女", "assets/images/female.svg"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    InputContainer("出生日期", isRequired: true),
                    SizedBox(width: 70),
                    InputContainer("身高"),
                    SizedBox(width: 70),
                    InputContainer("体重"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    InputContainer("联系电话", isRequired: true),
                    SizedBox(width: 70),
                    InputContainer("居住地"),
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
                  children: const [
                    InputContainer("状态", isRequired: true),
                    SizedBox(width: 70),
                    InputContainer("临床诊断"),
                    SizedBox(width: 70),
                    InputContainer("服药情况"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    InputContainer("入院日期"),
                    SizedBox(width: 70),
                    InputContainer("住院号"),
                    SizedBox(width: 70),
                    InputContainer("床号"),
                    SizedBox(width: 70),
                    InputContainer("出院日期"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("NYHA分级"),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    LevelSelectChip("1级"),
                    SizedBox(width: 40),
                    LevelSelectChip("2级"),
                    SizedBox(width: 40),
                    LevelSelectChip("3级"),
                    SizedBox(width: 40),
                    LevelSelectChip("4级"),
                  ],
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
                      onPressed: () {
                        getHttpTest();
                        //httpTest();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                        child: Text("提交"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: radiusStyle(10),
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                        child: Text("取消"),
                      ),
                    )
                  ],
                )
              ],
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
    Key key,
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
            ))
      ],
    );
  }
}

class LevelSelectChip extends StatelessWidget {
  const LevelSelectChip(
    this.level, {
    Key key,
  }) : super(key: key);

  final String level;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(level),
      avatar: const CircleAvatar(backgroundColor: primaryBlue),
      selectedColor: Colors.transparent,
      backgroundColor: Colors.white,
      onSelected: (value) {},
      selected: true,
    );
  }
}

class GenderSelectButton extends StatelessWidget {
  const GenderSelectButton(
    this.text,
    this.svgUri, {
    Key key,
  }) : super(key: key);

  final String svgUri;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: radiusStyle(10),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 25, right: 25, bottom: 10),
            child: SvgPicture.asset(svgUri),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer(this.title, {Key key, this.isRequired = false})
      : super(key: key);

  final String title;
  final bool isRequired;
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
          child: TextField(
            scrollPadding: EdgeInsets.zero,
            decoration: inputBoxDecoration(hintText: "请输入..."),
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}
