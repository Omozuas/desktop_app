import 'package:flutter/material.dart';

import '../../colorsConstrain/colorsHex.dart';

class SubTitleAndButton extends StatelessWidget {
  SubTitleAndButton(
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
                  color: GlobalColors.foundationblack500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          GestureDetector(
            onTap: ontap,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              buttonIcon,
              SizedBox(
                width: 5,
              ),
              Text(
                buttonTitle,
                style: TextStyle(
                    color: GlobalColors.foundationblack500,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
