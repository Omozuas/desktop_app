import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  EmptyContainer(
      {super.key,
      required this.child,
      required this.boderColor,
      required this.height,
      required this.width});
  Widget child;
  double width;
  double height;
  Color boderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: boderColor),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(5), bottom: Radius.circular(5)),
        ),
        child: child);
  }
}
