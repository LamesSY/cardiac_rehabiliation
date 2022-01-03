import 'package:cardiac_rehabilitation/dialog/dialog_add_user.dart';
import 'package:cardiac_rehabilitation/pages/components/search_result_table.dart';
import 'package:cardiac_rehabilitation/pages/components/search_user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text("管理员管理",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
              const SizedBox(height: defaultPadding),
              ElevatedButton.icon(
                onPressed: () {
                  Get.dialog(
                    DialogAddUser(),
                    barrierDismissible: false,
                  );
                },
                //style: radiusStyle(10),
                icon: const Icon(Icons.add),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                  child: Text("新增用户"),
                ),
              ),
              const SizedBox(height: defaultPadding),
              const UserSearchCard(),
              const SizedBox(height: defaultPadding),
              const ResultTable()
            ],
          ),
        ),
      ),
    );
  }
}
