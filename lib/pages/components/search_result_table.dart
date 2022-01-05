import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/model/manager_search_result.dart';
import 'package:flutter/material.dart';

class ResultTable extends StatelessWidget {
  const ResultTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HeadAndData(),
        SizedBox(height: 50),
        TableBottom(),
      ],
    );
  }
}

class TableBottom extends StatelessWidget {
  const TableBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cirBoxDecoration(),
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("1"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("2"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("3"),
          ),
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}

class HeadAndData extends StatelessWidget {
  const HeadAndData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        managerList.length + 1,
        (index) {
          if (index == 0) return const ResultTableHead();
          index -= 1;
          return UserDataRow(index);
        },
      ),
    );
  }
}

class UserDataRow extends StatelessWidget {
  const UserDataRow(
    this.dataIndex, {
    Key? key,
  }) : super(key: key);

  final int dataIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: cirBoxDecoration(),
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 16),
        child: Row(
          children: List.generate(
            8,
            (index) {
              return Expanded(
                flex: index == 2 || index == 7 ? 17 : 10,
                child: rowData(dataIndex, index),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget rowData(int dataIndex, int index) {
  switch (index) {
    case 0:
      return Text("${managerList[dataIndex].userId}");
      break;
    case 1:
      return Text(managerList[dataIndex].name);
      break;
    case 2:
      return Text(managerList[dataIndex].phoneNum);
      break;
    case 3:
      return Text(managerList[dataIndex].dep);
      break;
    case 4:
      return Text(managerList[dataIndex].role);
      break;
    case 5:
      return Text(managerList[dataIndex].date);
      break;
    case 6:
      return Text(
        managerList[dataIndex].status,
        style: TextStyle(
            fontSize: 16,
            color: managerList[dataIndex].status == "已启用"
                ? Colors.green
                : Colors.red),
      );
      break;
    case 7:
      return Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "编辑",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: defaultPadding),
          PopupMenuButton(
            tooltip: "",
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("重置密码"), value: 0),
                PopupMenuItem(child: Text("禁用"), value: 1),
                PopupMenuItem(child: Text("删除"), value: 2),
              ];
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      );
      break;
    default:
      return const Text("empty");
  }
}

class ResultTableHead extends StatelessWidget {
  const ResultTableHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: cirBoxDecoration(color: Colors.grey.shade200),
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      child: Row(
        children: List.generate(
          tableHead.length,
          (index) => Expanded(
            flex: index == 2 || index == 7 ? 17 : 10,
            child: Text(
              tableHead[index],
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
