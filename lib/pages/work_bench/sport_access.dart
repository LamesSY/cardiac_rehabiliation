import 'package:cardiac_rehabilitation/constants.dart';
import 'package:flutter/material.dart';

class SportAccess extends StatelessWidget {
  const SportAccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("部门名称",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text("日期: 2021年11月30日",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Icon(Icons.calendar_today, color: Colors.grey)
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_circle),
                label: Text("快速建档"),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 3,
            )
          ],
        )
      ],
    ));
  }
}
