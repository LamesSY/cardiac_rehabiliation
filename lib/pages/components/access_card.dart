import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/model/sport_access.dart';
import 'package:cardiac_rehabilitation/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccessCard extends StatelessWidget {
  const AccessCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/ic_add_circle_tran.svg"),
          const Text("快速建档", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}

class SportAccessCard extends StatelessWidget {
  const SportAccessCard(this.sportAccess, {Key key}) : super(key: key);
  final SportAccessEntity sportAccess;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: sportAccess.bgColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SvgPicture.asset(sportAccess.svgSrc), flex: 1),
          const SizedBox(width: defaultPadding),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (sportAccess.hasData == true)
                  Text(
                    "44",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _size.width > 1400 ? 30 : 15,
                        color: sportAccess.bgColor == Colors.white
                            ? Colors.black
                            : Colors.white),
                  ),
                Text(
                  sportAccess.subTitle,
                  style: TextStyle(
                      fontSize: _size.width > 1400 ? 18 : 14,
                      color: sportAccess.bgColor == Colors.white
                          ? Colors.black
                          : Colors.white),
                ),
              ],
            ),
          ),
          if (sportAccess.bgColor == Colors.white)
            const Expanded(
              flex: 1,
              child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            )
        ],
      ),
    );
  }
}
