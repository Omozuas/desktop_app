import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class TransactionMessages extends StatelessWidget {
  TransactionMessages(
      {super.key,
      required this.text1,
      required this.text2,
      required this.padding});
  String text1, text2;
  EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(text1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalColors.DarkBorder,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w900,
                )),
          ),
          Flexible(
            child: Text(text2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      ),
    );
  }
}
