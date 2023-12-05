import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  TransparentButton(
      {super.key,
      this.onPressed,
      this.text,
      required this.buttonHeight,
      this.buttonWidth,
      required this.child});
  final onPressed;
  final text;
  double? buttonWidth;
  double buttonHeight;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(width: 1, color: GlobalColors.buttonBlue)),
              minimumSize: Size(buttonWidth!, buttonHeight)),
          child: child),
    );
  }
}
