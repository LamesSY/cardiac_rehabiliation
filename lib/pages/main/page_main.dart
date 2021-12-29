import 'package:cardiac_rehabilitation/controllers/menu_controller.dart';
import 'package:cardiac_rehabilitation/pages/components/app_bar.dart';
import 'package:cardiac_rehabilitation/pages/components/manage_manager_card.dart';
import 'package:cardiac_rehabilitation/pages/components/side_menu.dart';
import 'package:cardiac_rehabilitation/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: const CusAppBar(
        userName: "lames444",
        avatarUri:
            "https://thirdwx.qlogo.cn/mmopen/vi_32/LFfNooakGBiaKntbj05UkxKhzTg45fnsjaibH7JPKXDWCEvlRkldn6soqgOwWsvzgAjQPFWnOjPAXuCdoNS8gMMg/132",
      ),
      drawer: SideMenu(),
      body: Container(
        margin: const EdgeInsets.only(top: 1),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(flex: 5, child: SideMenu()),
              Expanded(
                flex: 23,
                child: ManageManagerCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
