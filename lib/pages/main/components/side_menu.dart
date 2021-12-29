import 'package:cardiac_rehabilitation/constants.dart';
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
          children: [
            DrawerListTtile(
              title: "系统管理",
              svgScr: "icons/ic_Dashboard.svg",
              press: () {},
            ),
            DrawerListTtile(
              title: "工作台",
              svgScr: "icons/ic_Dashboard.svg",
              press: () {},
            ),
            DrawerListTtile(
              title: "患者管理",
              svgScr: "icons/ic_Dashboard.svg",
              press: () {},
            ),
            DrawerListTtile(
              title: "康复预约",
              svgScr: "icons/ic_Dashboard.svg",
              press: () {},
            ),
            DrawerListTtile(
              title: "康复排班",
              svgScr: "icons/ic_Dashboard.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTtile extends StatelessWidget {
  const DrawerListTtile({
    Key key,
    @required this.title,
    @required this.svgScr,
    @required this.press,
  }) : super(key: key);

  final String title, svgScr;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(svgScr),
      title: Container(
        margin: const EdgeInsets.only(left: defaultPadding),
        child: Text(
          title,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Courier"),
        ),
      ),
      trailing: const Icon(Icons.arrow_drop_down),
    );
  }
}
