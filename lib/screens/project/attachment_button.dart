import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class AttachmentButton extends StatelessWidget {
  final String t1;
  final double width;
  const AttachmentButton({super.key, required this.t1, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 163,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: GlobalColors.lightBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        SizedBox(
          width: 24,
          height: 24,
          child: GestureDetector(
            onTap: () {},
            child: Image.asset('assets/images/add.png'),
          ),
        ),
        SizedBox(
          width: width,
          height: 25,
          child: Text(
            t1,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: GlobalColors.foundationblack500),
          ),
        )
      ]),
    );
  }
}
