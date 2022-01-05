import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GenderDistribution extends StatelessWidget {
  const GenderDistribution({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Divider(color: Colors.grey.shade300, height: 1),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    height: 100,
                    width: 100,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            color: Colors.blue,
                            value: 66,
                            showTitle: false,
                            radius: 13,
                          ),
                          PieChartSectionData(
                            color: Colors.pink.shade100,
                            value: 34,
                            showTitle: false,
                            radius: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Chip(
                        label: Text("男性 66%"),
                        backgroundColor: Colors.white,
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 8,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Chip(
                        label: const Text("女性 34%"),
                        backgroundColor: Colors.white,
                        avatar: CircleAvatar(
                          backgroundColor: Colors.pink.shade100,
                          radius: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
