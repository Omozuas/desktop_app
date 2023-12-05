import 'package:flutter/material.dart';

import '../../colorsConstrain/colorsHex.dart';

class SearchBox extends StatelessWidget {
  SearchBox(
      {super.key,
      required this.controller,
      required this.iconData,
      required this.iconSize,
      required this.keys,
      required this.text});
  double iconSize;
  IconData iconData;
  Key keys;
  TextEditingController controller;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: iconSize,
            color: GlobalColors.foundationblack100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              key: keys,
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                hintTextDirection: TextDirection.ltr,
                hintMaxLines: 2,
                border: InputBorder.none,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
