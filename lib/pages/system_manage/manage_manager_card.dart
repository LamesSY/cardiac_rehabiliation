import 'package:cardiac_rehabilitation/pages/components/search_result_table.dart';
import 'package:cardiac_rehabilitation/pages/components/search_user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ManageManagerCard extends StatelessWidget {
  const ManageManagerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text("管理员管理",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
              const SizedBox(height: defaultPadding),
              ElevatedButton.icon(
                onPressed: () {
                  Get.defaultDialog(
                    barrierDismissible: false,
                    title: "添加用户",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 26),
                    content: SizedBox(
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(color: Colors.grey),
                          Row(
                            children: const [
                              Expanded(flex: 8, child: Text("用户昵称")),
                              Spacer(),
                              Expanded(flex: 8, child: Text("手机号码")),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: const [
                              Expanded(flex: 8, child: Text("角色")),
                              Spacer(),
                              Expanded(flex: 8, child: Text("所属部门科室")),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: const [
                              Expanded(flex: 8, child: Text("用户名称")),
                              Spacer(),
                              Expanded(flex: 8, child: Text("用户密码")),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: const [
                              Expanded(flex: 8, child: Text("性别")),
                              Spacer(),
                              Expanded(flex: 8, child: Text("状态")),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextField(decoration: inputWithBorder),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) => !value,
                                      shape: const CircleBorder(),
                                    ),
                                    const Text("启用"),
                                    const SizedBox(width: 15),
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) => !value,
                                      shape: const CircleBorder(),
                                    ),
                                    const Text("禁用"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          const Text("备注"),
                          TextField(
                            decoration: inputWithBorder,
                            minLines: 3,
                            maxLines: 4,
                          ),
                          const SizedBox(height: defaultPadding),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("提交"),
                                ),
                              ),
                              const SizedBox(width: 20),
                              OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("取消"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                  child: Text("新增用户"),
                ),
              ),
              const SizedBox(height: defaultPadding),
              const UserSearchCard(),
              const SizedBox(height: defaultPadding),
              const ResultTable()
            ],
          ),
        ),
      ),
    );
  }
}
