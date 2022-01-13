import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/logic/sport_appoint_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SportAccessAppointPage extends StatelessWidget {
  const SportAccessAppointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.put(SportAppointLogic());
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 18),
            child: Container(
              decoration: cirBoxDecoration(radius: 20, color: null),
              child: Row(
                children: const [
                  Expanded(flex: 10, child: DepSideMenu()),
                  verticalDivider,
                  Expanded(
                    flex: 32,
                    child: AppointTimePicker(),
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

class AppointTimePicker extends StatelessWidget {
  const AppointTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 900,
      child: Column(
        children: [
          DefaultTextStyle(
            style: const TextStyle(color: textColor4, fontSize: 14),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 3, top: 17, bottom: 18),
              child: Row(
                children: const [
                  Text(
                    "选择预约时间",
                    style: TextStyle(
                      inherit: false,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_left, color: textColor4),
                  Text("2021年11月15日～2021年11月21日"),
                  Icon(Icons.keyboard_arrow_right, color: textColor4),
                  Icon(Icons.calendar_today, color: textColor4)
                ],
              ),
            ),
          ),
          //divider,
          Row(
            children: List.generate(
              7,
              (index) => Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF1F1F1)),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 4),
                        child: Text("周一",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text("2021-01-02",
                            style: TextStyle(color: textColor4, fontSize: 14)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DepSideMenu extends StatelessWidget {
  const DepSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      height: 900,
      child: GetBuilder<SportAppointLogic>(
        id: 'sportAppointDep',
        builder: (_) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SportAppointLogic.to.depList.length + 1,
          separatorBuilder: (context, index) => divider,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "运动预约评估",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return ListTile(
                title: Text(SportAppointLogic.to.depList[index - 1].deptName),
                subtitle: Text(
                    "总:${SportAppointLogic.to.depList[index - 1].countNumber}  余:${SportAppointLogic.to.depList[index - 1].remainNumber}"),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              );
            }
          },
        ),
      ),
    );
  }
}
