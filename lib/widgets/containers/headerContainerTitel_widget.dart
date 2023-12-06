import 'package:flutter/material.dart';

class HeaderContainerTitle extends StatelessWidget {
  HeaderContainerTitle({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 30),
      child: Text(title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
