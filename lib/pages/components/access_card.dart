import 'package:cardiac_rehabilitation/constants.dart';
import 'package:flutter/material.dart';

class AccessCard extends StatelessWidget {
  const AccessCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.add_circle),
        label: Text("快速建档"),
      ),
    );
  }
}

class SportAccessCard extends StatelessWidget {
  const SportAccessCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cirBoxDecoration(),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add_circle_outline_rounded),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("44"), Text("预约评估")],
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
