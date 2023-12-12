import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/imageContainee/imagerContainerWithText_widget.dart';
import 'package:codegraniteflutter/widgets/showDialog/numberDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/LargButton_widget.dart';
import '../loginAndSignUP_widget/textFieldWithLabel_widget.dart';

class ProtectBox extends StatefulWidget {
  ProtectBox({
    super.key,
  });

  @override
  State<ProtectBox> createState() => _ProtectBoxState();
}

class _ProtectBoxState extends State<ProtectBox> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 406,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28.0, left: 28, right: 28, bottom: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 78,
                    height: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/codegranitesimg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              ImageContainerWithText(
                  height: 227,
                  width: 260,
                  imageAsset: "assets/images/keyys.png",
                  text: 'Protect your account in just two steps',
                  padding: EdgeInsets.only(bottom: 5)),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: LargButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context, builder: (context) => NumberBox());
                  },
                  buttonHeight: 56,
                  buttonWidth: 345,
                  text: "Get started",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
