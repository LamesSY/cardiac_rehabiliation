import 'package:flutter/material.dart';

import '../../constants.dart';

class DataStatistics extends StatelessWidget {
  const DataStatistics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: cirBoxDecoration(radius: 16),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Spacer(),
                    Text("0", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("今日"),
                    Spacer(),
                    Text("86", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("近7日"),
                    Spacer(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Spacer(),
                    Text("17", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("昨日"),
                    Spacer(),
                    Text("785", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("累计"),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
