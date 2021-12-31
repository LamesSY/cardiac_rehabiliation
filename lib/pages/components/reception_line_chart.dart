import 'package:flutter/material.dart';

import '../../constants.dart';

class ReceptionLineChart extends StatelessWidget {
  const ReceptionLineChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: cirBoxDecoration(radius: 16, color: Colors.grey));
  }
}
