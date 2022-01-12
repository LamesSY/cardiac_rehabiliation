import 'package:cardiac_rehabilitation/common/cr_colors.dart';
import 'package:cardiac_rehabilitation/data/menu_data.dart';
import 'package:cardiac_rehabilitation/responsive.dart';
import 'package:cardiac_rehabilitation/routes/route_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          margin: Responsive.isMobile(context) == true
              ? const EdgeInsets.only(top: 20)
              : EdgeInsets.zero,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: dashBoardBgColor, width: 1),
            ),
          ),
          child: Column(
            children: List.generate(
              menus.length,
              (index) {
                if (menus[index].subMenuList != null) {
                  return ExpansionDrawerList(menuInfo: menus[index]);
                }
                return DrawerListTtile(
                  title: menus[index].title,
                  press: () => Get.offNamed(Routes.patientManage),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ExpansionDrawerList extends StatelessWidget {
  const ExpansionDrawerList({
    Key? key,
    required this.menuInfo,
    this.trailing,
  }) : super(key: key);
  final MenuInfo menuInfo;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: SvgPicture.asset(menuInfo.leading),
      trailing: trailing,
      title: Text(
        menuInfo.title,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14),
      ),
      children: List.generate(
        menuInfo.subMenuList == null ? 0 : menuInfo.subMenuList!.length,
        (index) => ListTile(
          horizontalTitleGap: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              menuInfo.subMenuList![index].subTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          onTap: () => Get.offNamed(menuInfo.subMenuList![index].routeName),
        ),
      ),
    );
  }
}

class DrawerListTtile extends StatelessWidget {
  const DrawerListTtile({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset("assets/icons/ic_Dashboard.svg"),
      selectedColor: Colors.blueAccent,
      title: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Text(
          title,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}
