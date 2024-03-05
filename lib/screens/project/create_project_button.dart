import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class CreateProjectButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? color1, color2, color3;
  const CreateProjectButton(
      {super.key, required this.text, this.width, this.color1, this.color2, this.color3});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print('Project saved');
      },
      child: Container(
        alignment: Alignment.center,
        width: width ?? 180,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: color1 ?? GlobalColors.buttonBlue),
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8), bottom: Radius.circular(8)),
            color: color2 ?? GlobalColors.buttonBlue),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color3 ?? GlobalColors.whiteText),
        ),
      ),
    );
  }
}
