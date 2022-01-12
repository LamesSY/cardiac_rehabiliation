import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:flutter/material.dart';

class DataStatistics extends StatelessWidget {
  const DataStatistics({
    Key? key,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Divider(color: Colors.grey.shade300, height: 1),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              "运动评估并开处方患者统计",
              style: TextStyle(fontSize: 16, color: Colors.grey),
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
                    Text("0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("今日",
                        style: TextStyle(color: Colors.grey, fontSize: 18)),
                    Spacer(),
                    Text("86",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("近7日",
                        style: TextStyle(color: Colors.grey, fontSize: 18)),
                    Spacer(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Spacer(),
                    Text("17",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("昨日",
                        style: TextStyle(color: Colors.grey, fontSize: 18)),
                    Spacer(),
                    Text("785",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("累计",
                        style: TextStyle(color: Colors.grey, fontSize: 18)),
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
