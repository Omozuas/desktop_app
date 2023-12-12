import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

void success({String? message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message!,
      style: TextStyle(color: GlobalColors.whiteText),
    ),
    backgroundColor: GlobalColors.successGreen,
  ));
}

void error({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(
      message!,
      style: TextStyle(color: GlobalColors.whiteText),
    ),
    backgroundColor: GlobalColors.errorRed,
  ));
}
