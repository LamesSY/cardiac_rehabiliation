import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:flutter/material.dart';

class DialogChooseDisease extends StatelessWidget {
  const DialogChooseDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 900,
          height: 720,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("选择诊断疾病",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Divider(color: dividerColor),
              DiseaseGroup(),
              const Divider(color: dividerColor),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("提交")),
                  const SizedBox(width: 20),
                  OutlinedButton(onPressed: () {}, child: const Text("取消"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DiseaseGroup extends StatelessWidget {
  const DiseaseGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 22,
          child: ListView(
            shrinkWrap: true,
          ),
        ),
        const VerticalDivider(color: dividerColor, width: 1),
        Expanded(
          flex: 10,
          child: ListView(
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
