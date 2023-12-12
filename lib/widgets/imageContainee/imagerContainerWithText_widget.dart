import 'package:flutter/material.dart';

class ImageContainerWithText extends StatelessWidget {
  ImageContainerWithText(
      {super.key,
      required this.height,
      required this.width,
      required this.imageAsset,
      required this.text,
      required this.padding});
  double height, width;
  EdgeInsetsGeometry padding;
  String imageAsset, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Text(
          text,
          softWrap: true,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
