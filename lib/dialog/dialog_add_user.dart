import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogAddUser extends StatelessWidget {
  const DialogAddUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: 500,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("添加用户",
                  style: TextStyle(
                      inherit: false,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const Divider(color: dividerColor),
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
                    child: TextField(decoration: inputWithBorderSelection),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: TextField(decoration: inputWithBorderSelection),
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
                    child: TextField(decoration: inputWithBorderSelection),
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
              Padding(
                padding: const EdgeInsets.only(top: 4, right: 154),
                child: TextField(
                  decoration: inputWithBorder,
                  minLines: 3,
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: defaultPadding),
              const Divider(color: dividerColor),
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    //style: radiusStyle(10),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      child: Text("提交"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    //style: radiusStyle(10),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                        child:
                            Text("取消", style: TextStyle(color: Colors.black))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
