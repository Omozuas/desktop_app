import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class LargButton extends StatelessWidget {
  LargButton(
      {super.key,
      required this.onPressed,
      this.text,
      required this.buttonHeight,
      required this.buttonWidth});
  VoidCallback onPressed;
  final text;
  double buttonWidth;
  double buttonHeight;
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
            child: Text(
              text,
              style: TextStyle(
                  color: GlobalColors.whiteText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
