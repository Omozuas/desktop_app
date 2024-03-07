import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/alert_dialog_widget.dart';
import 'package:codegraniteflutter/screens/project/create_project_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StatusState { pending, inprogress, complete }

class ChangeStatusDialog extends StatefulWidget {
  const ChangeStatusDialog({super.key});

  @override
  State<ChangeStatusDialog> createState() => _ChangeStatusDialogState();
}

class _ChangeStatusDialogState extends State<ChangeStatusDialog> {
  StatusState? statusState = StatusState.pending;
  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
        widget: SizedBox(
            width: 335,
            height: 367,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    width: 273,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 31),
                          child: SizedBox(
                            width: 172,
                            height: 40,
                            child: Text(
                              'Change Status',
                              style: TextStyle(
                                  color: GlobalColors.foundationblack500,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 6),
                          child: SizedBox(
                            width: 10.5,
                            height: 10.5,
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
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Divider(),
                  ),
                  //const SizedBox(height: 10),
                  SizedBox(
                      width: 185,
                      height: 248,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 162,
                              height: 142,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Text(
                                      'Select Status',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              GlobalColors.foundationblack500),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 24,
                                    child: RadioListTile<StatusState>(
                                      title: Text(
                                        'Pending',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors.buttonBlue),
                                      ),
                                      value: StatusState.pending,
                                      groupValue: statusState,
                                      onChanged: (StatusState? value) {
                                        setState(() {
                                          statusState = value;
                                          print('Button tapped');
                                        });
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 24,
                                    child: RadioListTile<StatusState>(
                                      title: Text(
                                        'In Progress',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors.completeYellow),
                                      ),
                                      activeColor: GlobalColors.completeYellow,
                                      value: StatusState.inprogress,
                                      groupValue: statusState,
                                      onChanged: (StatusState? value) {
                                        setState(() {
                                          statusState = value;
                                          print('Button tapped');
                                        });
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 24,
                                    child: RadioListTile<StatusState>(
                                      title: Text(
                                        'Completed',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors.successGreen),
                                      ),
                                      activeColor: GlobalColors.successGreen,
                                      value: StatusState.complete,
                                      groupValue: statusState,
                                      onChanged: (StatusState? value) {
                                        setState(() {
                                          statusState = value;
                                          print('Button tapped');
                                        });
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  const CreateProjectButton(
                                    text: 'Update',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                ]),
              ),
            )));
  }
}
