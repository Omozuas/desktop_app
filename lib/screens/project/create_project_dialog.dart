import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/create_project_button.dart';
import 'package:codegraniteflutter/screens/project/attachment_button.dart';
import 'package:codegraniteflutter/screens/project/alert_dialog_widget.dart';
import 'package:codegraniteflutter/screens/project/divided_conyent_box.dart';
import 'package:codegraniteflutter/screens/project/content_box1.dart';
import 'package:codegraniteflutter/screens/project/box_with_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProjectDialog extends StatelessWidget {
  const CreateProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
      widget: SizedBox(
        width: 682,
        height: 1458,
        child: SingleChildScrollView(
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
                        'Create New Project',
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
                  width: 580,
                  height: 1270,
                  child: Column(
                    children: [
                      const ContentBox1(
                          h1: 82,
                          h3: 52,
                          t1: 'Project title',
                          t2: 'Enter project details here'),
                      const ContentBox1(
                          h1: 223,
                          h3: 193,
                          t1: 'Project description',
                          t2: "Please describe your project (optional)"),
                      const ContentBox1(
                          h1: 107, h3: 52, t1: 'Project owner', t2: 'xyz'),
                      const ContentBox1(
                          h1: 107, h3: 52, t1: 'Project owner', t2: 'xyz'),
                      const Row(children: [
                        DividedContentBox(
                          t1: 'Start date',
                          h1: 'DD/MM/YY',
                          widget: CalendarWidget(),
                        ),
                        Spacer(),
                        DividedContentBox(
                          t1: 'End date',
                          h1: 'DD/MM/YY',
                          widget: CalendarWidget(),
                        )
                      ]),
                      BoxWithDropdown(
                        height1: 86,
                        text1: 'Total cost of project',
                        text2: 'Enter amount',
                        widget: const CurrencyWidget(),
                        color: GlobalColors.greyBackground,
                        width1: 476,
                        height2: 30,
                        width2: 62,
                      ),
                      const Row(
                        children: [
                          DividedContentBox(
                              t1: 'Initial Payment',
                              widget: null,
                              h1: 'Enter amount'),
                          Spacer(),
                          DividedContentBox(
                              widget: null,
                              t1: 'Final Payment',
                              h1: 'Enter amount'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const BoxWithDropdown(
                          height1: 107,
                          text1: 'Project Staus',
                          width1: 524,
                          text2: 'Pending',
                          height2: 50,
                          width2: 48,
                          color: null,
                          widget: null),
                      const Row(
                        children: [
                          AttachmentButton(t1: 'Attach Docs', width: 83),
                          SizedBox(width: 10),
                          AttachmentButton(t1: 'Add Prototype', width: 100)
                        ],
                      ),
                      const SizedBox(height: 10),
                      const ContentBox1(
                          h1: 82,
                          t1: 'Additional Links (optional)',
                          h3: 52,
                          t2: 'Enter URL'),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 400),
                          CreateProjectButton(
                            text: 'Create project',
                          )
                        ],
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
