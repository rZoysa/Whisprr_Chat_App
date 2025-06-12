import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customnavigation {
  static void nextMaterialPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void nextMaterialPageReplace(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void nextMaterialPageReplaceAll(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }

  static void nextCupertinoPage(BuildContext context, Widget widget) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
  }

  static void nextCupertinoPageReplace(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => widget),
    );
  }

  static void nextCupertinoPageReplaceAll(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }
}
