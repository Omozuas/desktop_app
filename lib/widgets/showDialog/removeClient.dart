import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:flutter/material.dart';

class RemoveClient extends StatelessWidget {
  const RemoveClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 582,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28.0, left: 28, right: 28, bottom: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Remove Client",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Are you sure you want to permanently remove this client from the CodeGranites workspace? Remember this action cannot be reversed",
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
                      child: TransparentButton(
                          buttonHeight: 56,
                          buttonWidth: 245,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundcolor: GlobalColors.whiteText,
                          borderColor: GlobalColors.DarkBorder,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No, Cancel",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: GlobalColors.DarkBorder,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ))),
                  SizedBox(
                    width: 9,
                  ),
                  Flexible(
                    child: TransparentButton(
                        buttonHeight: 56,
                        buttonWidth: 245,
                        onPressed: () {},
                        backgroundcolor: GlobalColors.errorRed,
                        borderColor: GlobalColors.errorRed,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Yes, Delete",
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
