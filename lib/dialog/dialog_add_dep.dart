import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaLogAddDep extends StatelessWidget {
  const DiaLogAddDep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: 600,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  "添加部门科室",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    inherit: false,
                  ),
                ),
              ),
              const Divider(color: dividerColor),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("上级部门"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 26, right: 54, top: 4, bottom: 20),
                child: TextField(decoration: inputWithBorderSelection),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: const [
                    Expanded(child: Text("科室名称")),
                    SizedBox(width: 40),
                    Expanded(child: Text("状态")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 4, bottom: 25),
                child: Row(
                  children: [
                    Expanded(child: TextField(decoration: inputWithBorder)),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) => value,
                            shape: const CircleBorder(),
                          ),
                          const Text("启用"),
                          Checkbox(
                            value: true,
                            onChanged: (value) => value,
                            shape: const CircleBorder(),
                          ),
                          const Text("禁用"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("备注"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 26, right: 154, top: 4, bottom: 25),
                child: TextField(
                    decoration: inputWithBorder, maxLines: 3, minLines: 3),
              ),
              const Divider(color: dividerColor),
              Padding(
                padding: const EdgeInsets.only(left: 33, top: 30, bottom: 30),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
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
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                        child: Text(
                          "取消",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
