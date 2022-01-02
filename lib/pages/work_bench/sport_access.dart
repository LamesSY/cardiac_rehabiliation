import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/model/sport_access.dart';
import 'package:cardiac_rehabilitation/pages/components/access_card.dart';
import 'package:cardiac_rehabilitation/pages/components/gender_distribution_pie_chart.dart';
import 'package:cardiac_rehabilitation/pages/components/reception_line_chart.dart';
import 'package:cardiac_rehabilitation/pages/components/sport_access_data_statis.dart';
import 'package:cardiac_rehabilitation/responsive.dart';
import 'package:flutter/material.dart';

class SportAccess extends StatelessWidget {
  const SportAccess({Key key}) : super(key: key);
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
              const SizedBox(height: defaultPadding),
              Responsive(
                mobile: SportAccessGridView(
                  crossAxisCount: _size.width < 600 ? 2 : 4,
                  childAspectRatio: _size.width < 600 ? 1.8 : 2,
                ),
                tablet: SportAccessGridView(crossAxisCount: 5),
                desktop: SportAccessGridView(crossAxisCount: 5),
              ),
              const SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context))
                Container(
                    margin: EdgeInsets.only(bottom: 10),
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
                      const SizedBox(width: defaultPadding),
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

class SportAccessGridView extends StatelessWidget {
  const SportAccessGridView({
    Key key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: sportAccessList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => SportAccessCard(sportAccessList[index]),
    );
  }
}
