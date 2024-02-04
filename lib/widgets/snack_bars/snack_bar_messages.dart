import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive.dart';

void success({String? message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'success',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Text(message!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ))
          ],
        )
      ],
    ),
    backgroundColor: GlobalColors.successGreen,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.startToEnd,
    duration: Duration(seconds: 2),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: Responsive.isMobile(context)
            ? 500
            : Responsive.isTablet(context)
                ? 600
                : Responsive.isDesktop(context)
                    ? 900
                    : 1200,
        right: 50),
  ));
}

void error({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Center(
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fail',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Text(message!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    ),
    // ),
    backgroundColor: GlobalColors.errorRed,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.startToEnd,
    duration: Duration(seconds: 2),

    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: Responsive.isMobile(context)
            ? 500
            : Responsive.isTablet(context)
                ? 600
                : Responsive.isDesktop(context)
                    ? 900
                    : 1200,
        right: 50),
  ));
}
