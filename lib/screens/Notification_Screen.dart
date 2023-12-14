import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/allNotification_screen.dart';
import 'package:codegraniteflutter/screens/clientNotificationMessages_screen.dart';
import 'package:codegraniteflutter/screens/commentsNotificationMessages_screen.dart';
import 'package:codegraniteflutter/screens/messageNotification_screen.dart';
import 'package:codegraniteflutter/screens/transactionMessages.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationNavigationController());
    return Expanded(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderContainerTitle(title: 'Notifications'),
          Divider(),
          Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Obx(
                () => Row(
                  children: [
                    Flexible(
                      child: NotificationNavTab(
                        height: 56,
                        width: 163,
                        onTap: () => controller.selectedIndex.value = 0,
                        selected: controller.selectedIndex.value == 0,
                        title: 'All',
                      ),
                    ),
                    Flexible(
                      child: NotificationNavTab(
                        height: 56,
                        width: 163,
                        onTap: () => controller.selectedIndex.value = 1,
                        selected: controller.selectedIndex.value == 1,
                        title: 'Messages',
                      ),
                    ),
                    Flexible(
                      child: NotificationNavTab(
                        height: 56,
                        width: 163,
                        onTap: () => controller.selectedIndex.value = 2,
                        selected: controller.selectedIndex.value == 2,
                        title: 'Transactions',
                      ),
                    ),
                    Flexible(
                      child: NotificationNavTab(
                        height: 56,
                        width: 163,
                        onTap: () => controller.selectedIndex.value = 3,
                        selected: controller.selectedIndex.value == 3,
                        title: 'Comments',
                      ),
                    ),
                    Flexible(
                      child: NotificationNavTab(
                        height: 56,
                        width: 163,
                        onTap: () => controller.selectedIndex.value = 4,
                        selected: controller.selectedIndex.value == 4,
                        title: 'Client',
                      ),
                    ),
                  ],
                ),
              )),
          Divider(),
          Expanded(
            child: Row(
              children: [
                Obx(() => controller.screen[controller.selectedIndex.value]),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class NotificationNavTab extends StatelessWidget {
  NotificationNavTab(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap,
      required this.selected,
      required this.title});
  double width, height;
  VoidCallback onTap;
  String title;
  bool? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 30),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: GlobalColors.dividerLine),
            color: selected == false
                ? GlobalColors.whiteText
                : GlobalColors.buttonBlue,
            borderRadius: BorderRadiusDirectional.all(Radius.circular(5))),
        child: Center(
          child: ListTile(
            onTap: onTap,
            selected: selected!,
            title: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: selected == false
                      ? GlobalColors.DarkBorder
                      : GlobalColors.whiteText,
                )),
          ),
        ),
      ),
    );
  }
}

class NotificationNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    AllNotificationScreen(),
    MessageNotificationScreen(),
    TransactionMessagesScreen(),
    CommentsMessagesScreen(),
    ClientNotificationMessagesScreen(),
  ];
}
