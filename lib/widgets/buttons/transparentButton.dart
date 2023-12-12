import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  TransparentButton(
      {super.key,
      this.onPressed,
      this.text,
      required this.buttonHeight,
      this.buttonWidth,
      required this.backgroundcolor,
      required this.borderColor,
      required this.child});
  final onPressed;
  final text;
  double? buttonWidth;
  double buttonHeight;
  Widget child;
  Color borderColor, backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              surfaceTintColor: GlobalColors.whiteText,
              backgroundColor: backgroundcolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(width: 1, color: borderColor)),
              minimumSize: Size(buttonWidth!, buttonHeight)),
          child: child),
    );
  }
}
