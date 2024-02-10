import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class FieldDescription extends StatelessWidget {
  const FieldDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: GlobalColors.foundationblack500);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: 1173,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: GlobalColors.lightBorder)),
        child: Column(
          children: [
            SizedBox(
              width: 1170,
              height: 64,
              child: Row(
                children: [
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 372,
                    height: 30,
                    child: Text(
                      'Project Name',
                      style: textStyle,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 117,
                    height: 30,
                    child: Text(
                      'Amount',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 117,
                    height: 30,
                    child: Text(
                      'Payment Type',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 117,
                    height: 30,
                    child: Text(
                      'Date',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
