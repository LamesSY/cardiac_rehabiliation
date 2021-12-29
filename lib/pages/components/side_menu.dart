import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/model/menu_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
            children: List.generate(
          menus.length,
          (index) {
            if (menus[index].subMenuList != null) {
              return ExpansionDrawerList(menuInfo: menus[index]);
            } else {
              return DrawerListTtile(title: menus[index].title, press: () {});
            }
          },
        )),
      ),
    );
  }
}

class ExpansionDrawerList extends StatelessWidget {
  const ExpansionDrawerList({
    Key key,
    @required this.menuInfo,
    this.trailing,
  }) : super(key: key);
  final MenuInfo menuInfo;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: SvgPicture.asset(menuInfo.leading),
      trailing: trailing,
      //childrenPadding: const EdgeInsets.only(left: defaultPadding * 4),
      title: Text(
        menuInfo.title,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14),
      ),

      children: List.generate(
        menuInfo.subMenuList == null ? 0 : menuInfo.subMenuList.length,
        (index) => ListTile(
          horizontalTitleGap: 0.0,
          title: Text(
            menuInfo.subMenuList[index].subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class DrawerListTtile extends StatelessWidget {
  const DrawerListTtile({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset("icons/ic_Dashboard.svg"),
      //contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
      title: Container(
        margin: const EdgeInsets.only(left: defaultPadding),
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
