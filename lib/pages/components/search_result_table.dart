import 'package:cardiac_rehabilitation/model/manager_search_result.dart';
import 'package:flutter/material.dart';

class ResultTable extends StatelessWidget {
  const ResultTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white),
      child: DataTable(
        columns: List.generate(
          tableHead.length,
          (index) => DataColumn(
            label: Container(
              child: Text(tableHead[index]),
            ),
          ),
        ),
        rows: List.generate(
          managerList.length,
          (index) => DataRow(
            cells: [
              DataCell(Text("${managerList[index].userId}")),
              DataCell(Text(managerList[index].name)),
              DataCell(Text(managerList[index].phoneNum)),
              DataCell(Text(managerList[index].dep)),
              DataCell(Text(managerList[index].role)),
              DataCell(Text(managerList[index].date)),
              DataCell(Text(managerList[index].status)),
              DataCell(Text("随便啦")),
            ],
          ),
        ),
      ),
    );
  }
}
