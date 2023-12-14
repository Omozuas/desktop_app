import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:flutter/material.dart';

class ImageConainerWithAddProjectButton2 extends StatelessWidget {
  ImageConainerWithAddProjectButton2(
      {super.key,
      required this.ontap,
      required this.imageAsset,
      required this.buttonTitle,
      required this.textTitle});
  VoidCallback ontap;
  String buttonTitle, textTitle, imageAsset;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(textTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
        Padding(
          padding:
              const EdgeInsets.only(left: 30.0, top: 20, right: 30, bottom: 15),
          child: Container(
            width: 421,
            height: 342,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SmallButton(
          width: 160,
          buttonHeight: 56,
          onPressed: ontap,
          buttonWidth: 100,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.add,
              color: GlobalColors.whiteText,
              size: 20,
            ),
            Text(
              buttonTitle,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  color: GlobalColors.whiteText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ]),
        ),
      ],
    );
  }
}
