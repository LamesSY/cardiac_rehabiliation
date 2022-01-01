import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ReceptionLineChart extends StatelessWidget {
  const ReceptionLineChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: cirBoxDecoration(radius: 16, color: Colors.white),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          maxY: 14,
          minY: 0,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) => value % 2 == 0
                ? FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1)
                : FlLine(color: Colors.red.withOpacity(0.1), strokeWidth: 0),
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.transparent, strokeWidth: 0),
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(showTitles: true, interval: 2),
            bottomTitles: SideTitles(
              interval: 1,
              showTitles: true,
              getTitles: (value) =>
                  value > 0 && value < 11 ? "11/${value.toInt()}" : "",
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: [
                FlSpot(1, 1),
                FlSpot(2, 4),
                FlSpot(3, 5),
                FlSpot(4, 2),
                FlSpot(5, 8),
                FlSpot(6, 12),
                FlSpot(7, 4),
                FlSpot(8, 5),
                FlSpot(9, 2),
                FlSpot(10, 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
