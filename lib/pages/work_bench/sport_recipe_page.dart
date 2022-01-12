import 'package:cardiac_rehabilitation/data/sport_access.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/gender_distribution_pie_chart.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/reception_line_chart.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/sport_access_data_statis.dart';
import 'package:cardiac_rehabilitation/pages/work_bench/work_bench_pre_card.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class SportRecipePage extends StatelessWidget {
  const SportRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "部门名称",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: const [
                          Text(
                            "日期: 2021年11月30日",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Icon(Icons.calendar_today, color: Colors.grey)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Responsive(
                mobile: WorkBenchPreGridView(
                  sportRecpieList,
                  crossAxisCount: _size.width < 600 ? 3 : 5,
                  childAspectRatio: _size.width < 600 ? 1.8 : 2,
                ),
                tablet:
                    WorkBenchPreGridView(sportRecpieList, crossAxisCount: 5),
                desktop:
                    WorkBenchPreGridView(sportRecpieList, crossAxisCount: 5),
              ),
              const SizedBox(height: 15),
              if (Responsive.isMobile(context))
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 240,
                    child: ReceptionLineChart()),
              if (Responsive.isMobile(context)) DataStatistics(),
              if (Responsive.isMobile(context)) GenderDistribution(),
              if (!Responsive.isMobile(context))
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 500,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 23,
                        child: ReceptionLineChart(),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        flex: 10,
                        child: Column(
                          children: const [
                            Expanded(flex: 1, child: DataStatistics()),
                            Expanded(flex: 1, child: GenderDistribution())
                          ],
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
