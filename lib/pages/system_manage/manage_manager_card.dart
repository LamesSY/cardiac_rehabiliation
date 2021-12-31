import 'package:cardiac_rehabilitation/pages/components/search_result_table.dart';
import 'package:cardiac_rehabilitation/pages/components/search_user_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ManageManagerCard extends StatelessWidget {
  const ManageManagerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("管理员管理"),
              const SizedBox(height: defaultPadding),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: Text("新增用户"),
              ),
              const SizedBox(height: defaultPadding),
              UserSearchCard(),
              const SizedBox(height: defaultPadding),
              ResultTable()
            ],
          ),
        ),
      ),
    );
  }
}
