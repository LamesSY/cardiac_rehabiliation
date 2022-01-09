import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/logic/menu_controller.dart';
import 'package:cardiac_rehabilitation/components/app_bar.dart';
import 'package:cardiac_rehabilitation/components/side_menu.dart';
import 'package:cardiac_rehabilitation/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dash_board_root.dart';

class MainPage extends StatelessWidget {
  const MainPage(this.child, {Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      appBar: const CusAppBar(
        userName: "lames444",
        avatarUri:
            "https://thirdwx.qlogo.cn/mmopen/vi_32/LFfNooakGBiaKntbj05UkxKhzTg45fnsjaibH7JPKXDWCEvlRkldn6soqgOwWsvzgAjQPFWnOjPAXuCdoNS8gMMg/132",
      ),
      drawer: const SideMenu(),
      body: Container(
        color: dashBoardBgColor,
        child: SafeArea(
          top: true,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(flex: 5, child: SideMenu()),
              Expanded(
                flex: 23,
                child: child ?? Container(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
