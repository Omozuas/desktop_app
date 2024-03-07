import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/create_project_button.dart';
import 'package:codegraniteflutter/screens/project/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteProjectDialog extends StatelessWidget {
  const DeleteProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
      widget: SizedBox(
        width: 682,
        height: 367,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 51),
                    child: SizedBox(
                      width: 228,
                      height: 40,
                      child: Text(
                        'Delete Project',
                        style: TextStyle(
                            color: GlobalColors.foundationblack500,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 350),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          // ignore: avoid_print
                          print('Button tapped');
                        },
                        child: Image.asset('assets/images/cancel.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 56),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58, left: 51),
                child: SizedBox(
                  width: 546,
                  height: 148,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 50,
                          child: Text(
                            '''Are you sure you want to permanently remove this project from your catalogue? Remember this action cannot be reversed ''',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: GlobalColors.foundationblack500),
                            textAlign: TextAlign.center,
                          )),
                      const SizedBox(height: 42),
                      SizedBox(
                        height: 56,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CreateProjectButton(
                                  text: 'No, cancel',
                                  width: 184,
                                  color2: GlobalColors.whiteText,
                                  color3: GlobalColors.buttonBlue),
                              CreateProjectButton(
                                  text: 'Yes, Delete',
                                  width: 184,
                                  color1: GlobalColors.errorRed,
                                  color2: GlobalColors.errorRed,
                                  color3: GlobalColors.whiteText)
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
