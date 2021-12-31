import 'package:flutter/material.dart';

import '../../constants.dart';

class DataStatistics extends StatelessWidget {
  const DataStatistics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: cirBoxDecoration(radius: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              bottom: 15,
            ),
            child: Text(
              "数据统计",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.grey.shade300, height: 1),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
              bottom: 15,
            ),
            child: Text(
              "运动评估并开处方患者统计",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 2,
            shrinkWrap: true,
            childAspectRatio: 2,
            crossAxisCount: 2,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [Text("2"), Text("今日")],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [Text("14"), Text("昨日")],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [Text("76"), Text("近7日")],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [Text("5521"), Text("累计")],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
