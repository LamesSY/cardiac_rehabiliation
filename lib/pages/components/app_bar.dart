import 'package:cardiac_rehabilitation/common/cr_styles.dart';
import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/controllers/menu_controller.dart';
import 'package:cardiac_rehabilitation/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CusAppBar(
      {Key key,
      this.title = appTitle,
      @required this.userName,
      @required this.avatarUri,
      this.logoUri,
      this.sideButtonPress})
      : super(key: key);

  final String title, userName, avatarUri, logoUri;
  final VoidCallback sideButtonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: true,
        child: Stack(
          children: [
            BarHead(title),
            BarTrail(userName: userName, avatarUri: avatarUri)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class BarHead extends StatelessWidget {
  const BarHead(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: defaultPadding,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: defaultPadding, top: 10, bottom: 10),
            width: 21,
            height: 21,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.grey),
          ),
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            margin:
                const EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 10),
          ),
          if (!Responsive.isDesktop(context))
            InkWell(
              child: SvgPicture.asset(
                "assets/icons/navigation_show.svg",
                width: 24,
                height: 24,
              ),
              onTap: context.read<MenuController>().controlMenu,
            ),
        ],
      ),
    );
  }
}

class BarTrail extends StatelessWidget {
  const BarTrail({
    Key key,
    @required this.userName,
    @required this.avatarUri,
  }) : super(key: key);

  final String userName, avatarUri;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: defaultPadding,
      child: Row(
        children: [
          Text(userName),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
            width: 30,
            height: 30,
            child: ClipOval(
              child: Image.network(
                avatarUri,
                fit: BoxFit.cover,
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
