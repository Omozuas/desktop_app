import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  CustomProgressBar(
      {super.key,
      required this.height,
      required this.progress,
      required this.width});
  double width, height, progress;

  @override
  Widget build(BuildContext context) {
    Color color;

    if (progress <= 52) {
      color = Colors.black;
    } else if (progress <= 156) {
      color = Colors.yellow;
    } else if (progress <= 157) {
      color = Colors.green;
    } else {
      // Default to green if progress exceeds 157%
      color = Colors.green;
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Container(
          width: progress,
          height: height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
        )
      ]),
    );
  }
}
