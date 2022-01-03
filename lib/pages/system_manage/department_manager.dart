import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/dialog/dialog_add_dep.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepManageDashboard extends StatelessWidget {
  const DepManageDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("部门科室管理", style: TextStyle(fontSize: 18)),
              const SizedBox(height: defaultPadding),
              ElevatedButton.icon(
                onPressed: () {
                  Get.dialog(DiaLogAddDep());
                },
                icon: const Icon(Icons.add),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                  child: Text("新增"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration:
                    cirBoxDecoration(color: Colors.grey.withOpacity(0.2)),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: smallGreyText("部门名称"), flex: 59),
                      Expanded(child: smallGreyText("创建日期"), flex: 17),
                      Expanded(child: smallGreyText("状态"), flex: 10),
                      Expanded(child: smallGreyText("操作"), flex: 18),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: cirBoxDecoration(color: Colors.white),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 59,
                        child: Row(
                          children: [
                            Icon(Icons.keyboard_arrow_down),
                            Text("中国人民解放军总医院")
                          ],
                        ),
                      ),
                      Expanded(child: Text("2021-02-04"), flex: 17),
                      Expanded(child: Text("已禁用"), flex: 10),
                      Expanded(
                        flex: 18,
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: () {}, child: Text("编辑")),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert),
                              splashRadius: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: cirBoxDecoration(color: Colors.white),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 59,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: defaultPadding * 2),
                          child: Row(
                            children: [
                              Icon(Icons.keyboard_arrow_down),
                              Text("第六医学中心")
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Text("2021-02-04"), flex: 17),
                      Expanded(child: Text("已禁用"), flex: 10),
                      Expanded(
                        flex: 18,
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: () {}, child: Text("编辑")),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert),
                              splashRadius: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                decoration: cirBoxDecoration(color: Colors.white),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 59,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: defaultPadding * 6),
                          child: Row(
                            children: [
                              //Icon(Icons.keyboard_arrow_down),
                              Text("心内1科")
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Text("2021-02-04"), flex: 17),
                      Expanded(child: Text("已禁用"), flex: 10),
                      Expanded(
                        flex: 18,
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: () {}, child: Text("编辑")),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert),
                              splashRadius: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text smallGreyText(String content) {
    return Text(
      content,
      style: TextStyle(color: Colors.grey),
    );
  }
}
