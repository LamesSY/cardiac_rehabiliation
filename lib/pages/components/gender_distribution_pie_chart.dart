import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class GenderDistribution extends StatelessWidget {
  const GenderDistribution({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cirBoxDecoration(radius: 16, color: Colors.white),
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
              "性别分布",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.grey.shade300, height: 1),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                height: 120,
                width: 120,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 30,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        color: Colors.blue,
                        value: 66,
                        showTitle: false,
                        radius: 10,
                      ),
                      PieChartSectionData(
                        color: Colors.pink.shade100,
                        value: 34,
                        showTitle: false,
                        radius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text("男性 66%"),
                  Text("女性 34%"),
                ],
              ),
              const SizedBox(width: 15)
            ],
          )
        ],
      ),
    );
  }
}
