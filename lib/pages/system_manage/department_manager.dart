import 'package:cardiac_rehabilitation/constants.dart';
import 'package:flutter/material.dart';

class DepManageDashboard extends StatelessWidget {
  const DepManageDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("部门科室管理"),
          const SizedBox(height: defaultPadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text("Add New"),
          ),
        ],
      ),
    );
  }
}
