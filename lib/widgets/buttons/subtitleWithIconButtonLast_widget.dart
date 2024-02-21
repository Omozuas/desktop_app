import 'package:flutter/material.dart';

import '../../colorsConstrain/colorsHex.dart';

class SubtitleWithIconButtonLast extends StatelessWidget {
  SubtitleWithIconButtonLast(
      {super.key,
      required this.padding,
      required this.title,
      required this.iconData,
      required this.buttonTitle,
      required this.buttonIcon,
      required this.ontap});
  EdgeInsetsGeometry padding;
  Widget iconData, buttonIcon;
  String title, buttonTitle;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            iconData,
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: GlobalColors.DarkBorder,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          GestureDetector(
            onTap: ontap,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    buttonTitle,
                    style: TextStyle(
                        color: GlobalColors.DarkBorder,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  buttonIcon,
                ]),
          )
        ],
      ),
    );
  }
}
