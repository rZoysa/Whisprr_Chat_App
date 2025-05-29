import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customnavigation {
  static void nextMaterialPage(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static void nextCupertinoPage(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => widget,
        ));
  }
}