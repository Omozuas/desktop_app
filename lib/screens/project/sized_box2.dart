import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class BoxWithDropdown extends StatelessWidget {
  final double? height1, width2, height2, width1;
  final String text1, text2;
  final Widget? widget;
  final Color? color;
  const BoxWithDropdown(
      {super.key,
      required this.height1,
      required this.text1,
      required this.width1,
      required this.text2,
      required this.height2,
      required this.width2,
      this.widget,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 580,
      height: height1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 22,
          child: Text(
            text1,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: GlobalColors.DarkBorder,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: GlobalColors.lightBorder)),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: width1,
                  child: TextField(
                      cursorHeight: 5,
                      decoration: InputDecoration.collapsed(
                          hintText: text2,
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: GlobalColors.greyText))),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: GlobalColors.greyBackground)),
                width: width2,
                height: height2,
                child: GestureDetector(
                    onTap: () {
                      print('Button tapped');
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            width: 25,
                            height: 27,
                            child: widget ?? const SizedBox()),
                        const SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                            width: 16,
                            height: 16,
                            child: Image.asset('assets/images/arrow-down.png')),
                      ],
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'USD',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: GlobalColors.foundationblack500,
      ),
    );
  }
}
