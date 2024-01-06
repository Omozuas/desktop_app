import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/setting_screen/AccountPrefrence_screen.dart';
import 'package:codegraniteflutter/screens/setting_screen/Profile_Screen.dart';
import 'package:codegraniteflutter/screens/setting_screen/notificationSetting_screen.dart';
import 'package:codegraniteflutter/screens/setting_screen/security_screen.dart';
import 'package:codegraniteflutter/screens/setting_screen/workSpace_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsNavMenue extends StatelessWidget {
  const SettingsNavMenue({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsNavigationController());

    return Scaffold(
        body: Row(children: [
      Container(
          height: double.infinity,
          width: 210,
          color: GlobalColors.whiteText,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.only(left: 21, right: 1),
                child: Obx(
                  () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingsNavMenueTab(
                          onTap: () => controller.selectedIndex.value = 0,
                          selected: controller.selectedIndex.value == 0,
                          title: 'Profile',
                        ),
                        SettingsNavMenueTab(
                          onTap: () => controller.selectedIndex.value = 1,
                          selected: controller.selectedIndex.value == 1,
                          title: 'Account preferences',
                        ),
                        SettingsNavMenueTab(
                          onTap: () => controller.selectedIndex.value = 2,
                          selected: controller.selectedIndex.value == 2,
                          title: 'Security',
                        ),
                        SettingsNavMenueTab(
                          onTap: () => controller.selectedIndex.value = 3,
                          selected: controller.selectedIndex.value == 3,
                          title: 'Workspace',
                        ),
                        SettingsNavMenueTab(
                          onTap: () => controller.selectedIndex.value = 4,
                          selected: controller.selectedIndex.value == 4,
                          title: 'Notifications',
                        ),
                      ]),
                )),
          )),
      Expanded(
          child: Row(
        children: [
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: GlobalColors.dividerLine,
          ),
          Obx(() => controller.screen[controller.selectedIndex.value])
        ],
      ))
    ]));
  }
}

class SettingsNavMenueTab extends StatelessWidget {
  SettingsNavMenueTab(
      {super.key,
      this.height,
      this.width,
      required this.onTap,
      required this.title,
      required this.selected});
  double? width;
  double? height;

  VoidCallback onTap;
  String title;
  bool? selected;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: selected == false
                ? GlobalColors.whiteText
                : GlobalColors.lightBlue,
            borderRadius: BorderRadiusDirectional.all(Radius.circular(5))),
        child: Center(
          child: ListTile(
            onTap: onTap,
            selected: selected!,
            title: Text(title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: selected == false
                      ? GlobalColors.DarkBorder
                      : GlobalColors.DarkBorder,
                )),
          ),
        ),
      ),
    );
  }
}

class SettingsNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    ProfileScreen(),
    AccountPrefrenceScreen(),
    SecurityScreen(),
    WorkSpaceScreen(),
    NotificationSeetingScreen(),
  ];
}
