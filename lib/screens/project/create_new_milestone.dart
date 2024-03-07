import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/alert_dialog_widget.dart';
import 'package:codegraniteflutter/screens/project/content_box1.dart';
import 'package:codegraniteflutter/screens/project/create_project_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StatusState { pending, inprogress, complete }

class CreateNewMilestone extends StatefulWidget {
  const CreateNewMilestone({super.key});

  @override
  State<CreateNewMilestone> createState() => _CreateNewMilestoneState();
}

class _CreateNewMilestoneState extends State<CreateNewMilestone> {
  StatusState? statusState = StatusState.pending;
  bool createMore = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
      widget: SizedBox(
        width: 682,
        height: 811,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 48),
                    child: SizedBox(
                      width: 259,
                      height: 40,
                      child: Text(
                        'Create New Milestone',
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
                  width: 581,
                  height: 584,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ContentBox1(
                          h1: 107,
                          h3: 52,
                          t1: 'Milestone title',
                          t2: 'Enter title',
                        ),
                        const ContentBox1(
                          h1: 223,
                          h3: 193,
                          t1: 'Add Description',
                          t2: 'Type here',
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                            width: 250,
                            height: 142,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    'Select Status',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: GlobalColors.foundationblack500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 20,
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
                                  height: 20,
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
                                  height: 20,
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
                                )
                              ],
                            )),
                        const Spacer(),
                        SizedBox(
                          height: 56,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 150,
                              ),
                              SizedBox(
                                width: 140,
                                height: 25,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Switch(
                                          value: createMore,
                                          activeColor: GlobalColors.buttonBlue,
                                          onChanged: (bool value) {
                                            // This is called when the user toggles the switch.
                                            setState(() {
                                              createMore = value;
                                            });
                                          }),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 90,
                                      height: 25,
                                      child: Text(
                                        'Create more',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors
                                                .foundationblack500),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const CreateProjectButton(
                                text: 'Create Milestone',
                                width: 234,
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
