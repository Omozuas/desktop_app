import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/Dashboard_screen.dart';
import 'package:codegraniteflutter/screens/Login_Screen.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/NavController.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:codegraniteflutter/widgets/navProfileMenue_widget/navProfileMenue_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ionicons/ionicons.dart';

import 'widgets/NavTabMenue/MainNavTab_wideget.dart';

class NavigationMenue extends StatefulWidget {
  const NavigationMenue({super.key});

  @override
  State<NavigationMenue> createState() => _NavigationMenueState();
}

class _NavigationMenueState extends State<NavigationMenue> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        body: Row(children: [
      Container(
          height: double.infinity,
          width: 250,
          color: GlobalColors.whiteText,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Container(
                        width: 155,
                        height: 53,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/codegranitesimg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Obx(() => Column(
                          children: [
                            NavMenueTab(
                              iconData: Icons.dashboard_outlined,
                              width: 245,
                              height: 47,
                              onTap: () => controller.selectedIndex.value = 0,
                              selected: controller.selectedIndex.value == 0,
                              title: 'Dashboard',
                            ),
                            NavMenueTab(
                              iconData: CupertinoIcons.question_square,
                              width: 245,
                              height: 50,
                              title: 'Problem Statements',
                              onTap: () => controller.selectedIndex.value = 1,
                              selected: controller.selectedIndex.value == 1,
                            ),
                            NavMenueTab(
                              iconData: Icons.work_outline_rounded,
                              width: 245,
                              height: 47,
                              title: 'Projects',
                              onTap: () => controller.selectedIndex.value = 2,
                              selected: controller.selectedIndex.value == 2,
                            ),
                            NavMenueTab(
                              iconData: CupertinoIcons.person_3,
                              width: 245,
                              height: 47,
                              title: 'Clients',
                              onTap: () => controller.selectedIndex.value = 3,
                              selected: controller.selectedIndex.value == 3,
                            ),
                            NavMenueTab(
                              iconData: Icons.receipt_long_sharp,
                              width: 245,
                              height: 47,
                              title: 'Transactions',
                              onTap: () => controller.selectedIndex.value = 4,
                              selected: controller.selectedIndex.value == 4,
                            ),
                            NavMenueTab(
                              iconData: CupertinoIcons.chat_bubble_text,
                              width: 245,
                              height: 47,
                              title: 'Message',
                              onTap: () => controller.selectedIndex.value = 5,
                              selected: controller.selectedIndex.value == 5,
                            ),
                            NavMenueTab(
                              iconData: CupertinoIcons.bell,
                              width: 245,
                              height: 47,
                              title: 'Notification',
                              onTap: () => controller.selectedIndex.value = 6,
                              selected: controller.selectedIndex.value == 6,
                            ),
                            NavMenueTab(
                              iconData: Icons.add_circle_outline,
                              width: 245,
                              height: 47,
                              title: 'Invite',
                              onTap: () => controller.selectedIndex.value = 7,
                              selected: controller.selectedIndex.value == 7,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: GlobalColors.dividerLine,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            NavMenueTab(
                              iconData: CupertinoIcons.gear,
                              width: 245,
                              height: 47,
                              title: 'Settings',
                              onTap: () => controller.selectedIndex.value = 8,
                              selected: controller.selectedIndex.value == 8,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: NavMenueProfile(
                                onTap: () {},
                                image: 'assets/images/Image.png',
                                name: "Jane Doe",
                                email: "JohnDoe@gmail",
                              ),
                            ),
                          ],
                        ))
                  ]),
              // ),
            ),
          )),
      Expanded(
          child: Row(
        children: [
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: GlobalColors.dividerLine,
          ),
          Obx(() => controller.screen[controller.selectedIndex.value]),
        ],
      ))
    ]));
  }
}
