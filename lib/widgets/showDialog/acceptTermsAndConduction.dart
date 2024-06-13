import 'package:flutter/material.dart';

class AcceptTermsAndConditionPage extends StatelessWidget {
  const AcceptTermsAndConditionPage({super.key, this.onTap});
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "data",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          width: 100,
          height: 50,
          child: GestureDetector(
            onTap: onTap,
            child: Center(
                child: Text(
              "accept",
              style: TextStyle(fontSize: 20),
            )),
          ),
          decoration: BoxDecoration(border: Border.all(width: 1)),
        ),
      ],
    );
  }
}
