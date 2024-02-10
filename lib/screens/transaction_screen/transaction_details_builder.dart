import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class TransactionDetailsBuilder extends StatelessWidget {
  const TransactionDetailsBuilder(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.color1,
      required this.color2,
      //required this.padding
      });
  //final EdgeInsetsGeometry? padding;

  final String text1, text2, text3, text4, text5;
  final Color color1, color2;
  

  @override
  Widget build(BuildContext context) {
    var textStyle1 =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color1);
    var textStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color2);
    
    return SizedBox(
      width: 1170,
      child: Row(children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: SizedBox(
            width: 32,
            height: 32,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: GlobalColors.foundationblack100,
              child: Text(
                text1,
                style: TextStyle(
                  color: GlobalColors.foundationblack500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 372,
          height: 30,
          child: Text(
            text2,
            style: textStyle,
            textAlign: TextAlign.start,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 117,
          height: 30,
          child: Text(
            text3,
            style: textStyle1,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 117,
          height: 30,
          child: Text(
            text4,
            style: textStyle1,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 117,
          height: 30,
          child: Text(
            text5,
            style: textStyle1,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
