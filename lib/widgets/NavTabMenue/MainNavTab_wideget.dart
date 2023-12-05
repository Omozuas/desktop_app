import 'package:flutter/material.dart';

import '../../colorsConstrain/colorsHex.dart';

class NavMenueTab extends StatelessWidget {
  NavMenueTab(
      {super.key,
      this.height,
      this.width,
      required this.onTap,
      required this.iconData,
      required this.title,
      required this.selected});
  double? width;
  double? height;
  IconData iconData;
  VoidCallback onTap;
  String title;
  bool? selected;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: selected == false
                ? GlobalColors.whiteText
                : GlobalColors.buttonBlue,
            borderRadius: BorderRadiusDirectional.all(Radius.circular(5))),
        child: Center(
          child: ListTile(
            onTap: onTap,
            selected: selected!,
            leading: Icon(
              iconData,
              color: selected == false
                  ? GlobalColors.DarkBorder
                  : GlobalColors.whiteText,
              size: 28,
            ),
            title: Text(title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: selected == false
                      ? GlobalColors.DarkBorder
                      : GlobalColors.whiteText,
                )),
          ),
        ),
      ),
    );
  }
}
