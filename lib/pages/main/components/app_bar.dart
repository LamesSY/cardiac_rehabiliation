import 'package:cardiac_rehabilitation/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CusAppBar extends StatefulWidget implements PreferredSizeWidget {
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
  _CusAppBarState createState() => _CusAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

class _CusAppBarState extends State<CusAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 55,
      child: SafeArea(
        top: true,
        child: Stack(
          children: [
            BarHead(title: widget.title, onPress: widget.sideButtonPress),
            BarTrail(userName: widget.userName, avatarUri: widget.avatarUri)
          ],
        ),
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

class BarHead extends StatelessWidget {
  const BarHead({Key key, @required this.title, this.onPress})
      : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: defaultPadding,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: defaultPadding),
            width: 21,
            height: 21,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.grey),
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            margin: const EdgeInsets.only(left: 5, right: 20),
          ),
          InkWell(
            child: SvgPicture.asset(
              "icons/navigation_show.svg",
              width: 24,
              height: 24,
            ),
            onTap: onPress,
          ),
        ],
      ),
    );
  }
}
