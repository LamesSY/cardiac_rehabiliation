import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/pages/components/access_card.dart';
import 'package:flutter/material.dart';

class SportAccess extends StatelessWidget {
  const SportAccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
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
          FileInfoCardGridView()
        ],
      ),
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) => SportAccessCard());
  }
}
