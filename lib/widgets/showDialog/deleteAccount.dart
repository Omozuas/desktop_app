import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:flutter/material.dart';

class DeleteAccountBox extends StatelessWidget {
  DeleteAccountBox({
    super.key,
  });

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
              Text(
                  "Are you sure you want to delete your account? this cannot be reversed ",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: GlobalColors.DarkBorder,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    child: LargButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonHeight: 56,
                      buttonWidth: 345,
                      text: "Cancel",
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Flexible(
                    child: TransparentButton(
                        buttonHeight: 56,
                        buttonWidth: 345,
                        onPressed: () {},
                        backgroundcolor: GlobalColors.errorRed,
                        borderColor: GlobalColors.errorRed,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_forever_outlined,
                              color: GlobalColors.whiteText,
                            ),
                            Text("Delete",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: GlobalColors.whiteText,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
