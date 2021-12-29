import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/model/manager_search_result.dart';
import 'package:flutter/material.dart';

class ResultTable extends StatelessWidget {
  const ResultTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            decoration: cirBoxDecoration(),
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
                  DataCell(Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("编辑")),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        splashRadius: 12,
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding * 2),
        Container(
          decoration: cirBoxDecoration(),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: () {},
                splashRadius: 1,
              ),
              RawMaterialButton(
                onPressed: () {},
                child: Text("1"),
                constraints: const BoxConstraints(minWidth: defaultPadding),
              ),
              RawMaterialButton(
                onPressed: () {},
                child: Text("2"),
                constraints: const BoxConstraints(minWidth: defaultPadding),
              ),
              RawMaterialButton(
                onPressed: () {},
                child: Text("3"),
                constraints: const BoxConstraints(minWidth: defaultPadding),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {},
                splashRadius: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
