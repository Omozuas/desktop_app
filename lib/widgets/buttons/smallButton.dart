import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  SmallButton(
      {super.key,
      this.onPressed,
      this.text,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.child});
  final onPressed;
  final text;
  double buttonWidth;
  double buttonHeight;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.buttonBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(buttonWidth, buttonHeight)),
              child: child),
        ],
      ),
    );
  }
}
