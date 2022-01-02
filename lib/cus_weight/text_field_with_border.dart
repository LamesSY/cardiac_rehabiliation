import 'package:flutter/material.dart';

class TextFieldWithBorder extends StatelessWidget {
  const TextFieldWithBorder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          gapPadding: 1,
          borderSide: BorderSide(width: 0.1),
        ),
      ),
    );
  }
}
