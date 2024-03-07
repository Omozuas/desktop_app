import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final Widget widget;
  const AlertDialogWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(backgroundColor: GlobalColors.whiteText,
      shadowColor: GlobalColors.whiteText,
      surfaceTintColor: GlobalColors.whiteText,
      contentPadding: null,
      content: widget,
    );
  }
}
