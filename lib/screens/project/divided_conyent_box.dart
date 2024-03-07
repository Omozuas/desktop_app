import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class DividedContentBox extends StatelessWidget {
  final String t1, h1;
  final Widget? widget;
  const DividedContentBox(
      {super.key, required this.t1, required this.widget, required this.h1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 278,
      height: 86,
      child: Column(children: [
        SizedBox(
          width: 278,
          height: 22,
          child: Text(
            t1,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: GlobalColors.DarkBorder,
            ),
          ),
        ),
        Container(
          width: 278,
          height: 56,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: GlobalColors.lightBorder)),
          child: Row(children: [
            SizedBox(
              width: 222,
              height: 20,
              child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: h1,
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: GlobalColors.greyText))),
            ),
            widget ?? SizedBox()
          ]),
        )
      ]),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 24,
        height: 24,
        child: Image.asset('assets/images/calendar.png'));
  }
}
