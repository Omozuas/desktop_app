import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/attachment_button.dart';
import 'package:codegraniteflutter/screens/project/create_project_button.dart';
import 'package:codegraniteflutter/screens/project/divided_box.dart';
import 'package:codegraniteflutter/screens/project/sized_box.dart';
import 'package:codegraniteflutter/screens/project/sized_box2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProjectDialog extends StatelessWidget {
  const EditProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      'Edit Project',
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
                    const Box(
                        h1: 82,
                        h3: 52,
                        t1: 'Project title',
                        t2: 'Emergency Response App'),
                    const Box(
                        h1: 223,
                        h3: 193,
                        t1: 'Project description',
                        t2: '''Empower communities and individuals with the Emergency Response App, 
                        a groundbreaking solution designed to enhance and expedite emergency assistance. 
                        This app integrates real-time location tracking, 
                        instant communication features, and emergency service coordination to
                         provide swift response during critical situations.
                          With an intuitive interface and seamless collaboration tools,
                           the Emergency Response App is your go-to resource for rapid and
                            effective crisis management. Prioritize safety and responsiveness 
                            with this essential tool for emergency situations'''),
                    const Box(
                        h1: 107,
                        h3: 52,
                        t1: 'Project owner',
                        t2: 'Karl Mbemba'),
                    const Box(
                        h1: 107, h3: 52, t1: 'Project owner', t2: 'John Doe'),
                    const Row(children: [
                      DividedBox(
                        t1: 'Start date',
                        h1: '12/04/2024',
                        widget: CalendarWidget(),
                      ),
                      Spacer(),
                      DividedBox(
                        t1: 'End date',
                        h1: '12/06/2024',
                        widget: CalendarWidget(),
                      )
                    ]),
                    BoxWithDropdown(
                      height1: 86,
                      text1: 'Total cost of project',
                      text2: "\$5000",
                      widget: const CurrencyWidget(),
                      color: GlobalColors.greyBackground,
                      width1: 476,
                      height2: 30,
                      width2: 62,
                    ),
                    const Row(
                      children: [
                        DividedBox(
                            t1: 'Initial Payment', widget: null, h1: '\$3500'),
                        Spacer(),
                        DividedBox(
                            widget: null, t1: 'Final Payment', h1: '\$1500'),
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
                    Box(
                      h1: 82,
                      t1: 'Additional Links (optional)',
                      h3: 52,
                      widget: Text(
                        'https://www.figma.com/proto/ABCDE12345/My-Project?page-id=67890%3A1&node-id=67891%3A456',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: GlobalColors.deepBlue),
                      ),
                      color: GlobalColors.lightBlue,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 189),
                        CreateProjectButton(
                          color1: GlobalColors.buttonBlue,
                          color2: GlobalColors.whiteText,
                          color3: GlobalColors.buttonBlue,
                          text: 'Cancel',
                        ),
                        const SizedBox(width: 28),
                        const CreateProjectButton(
                          text: 'Save Changes',
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
    );
  }
}
