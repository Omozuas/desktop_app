import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/messages_screen/all_Messages_screen.dart';
import 'package:codegraniteflutter/screens/messages_screen/draft_Mssages_Screen.dart';
import 'package:codegraniteflutter/screens/messages_screen/inbox_messages.dart';
import 'package:codegraniteflutter/screens/messages_screen/rescive_Messages.dart';
import 'package:codegraniteflutter/screens/messages_screen/sent_Messages.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:codegraniteflutter/widgets/imageContainee/imageConainer_With_AddProjectButton_widget.dart';
import 'package:codegraniteflutter/widgets/imageContainee/imagecontainerwithbutton2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesMainScreeen extends StatelessWidget {
  const MessagesMainScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessageNavigationController());
    return Expanded(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainerTitle(title: 'Messages'),
              Divider(),
              Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: MessageNavTab2(
                            height: 48,
                            width: 181,
                            onTap: () => controller.selectedIndex.value = 0,
                            selected: controller.selectedIndex.value == 0,
                            title: 'All message',
                          ),
                        ),
                        Flexible(
                          child: MessageNavTab(
                            height: 48,
                            width: 92,
                            onTap: () => controller.selectedIndex.value = 1,
                            selected: controller.selectedIndex.value == 1,
                            title: 'Inbox',
                          ),
                        ),
                        Flexible(
                          child: MessageNavTab(
                            height: 48,
                            width: 82,
                            onTap: () => controller.selectedIndex.value = 2,
                            selected: controller.selectedIndex.value == 2,
                            title: 'Sent',
                          ),
                        ),
                        Flexible(
                          child: MessageNavTab(
                            height: 48,
                            width: 122,
                            onTap: () => controller.selectedIndex.value = 3,
                            selected: controller.selectedIndex.value == 3,
                            title: 'Recivied',
                          ),
                        ),
                        Flexible(
                          child: MessageNavTab(
                            height: 48,
                            width: 82,
                            onTap: () => controller.selectedIndex.value = 4,
                            selected: controller.selectedIndex.value == 4,
                            title: 'Draft',
                          ),
                        ),
                      ],
                    ),
                  )),

              // Center(
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.only(top: 80, bottom: 15),
              //           child: ImageConainerWithAddProjectButton4(
              //               ontap: () {
              //                 // showDialog(
              //                 //     context: context,
              //                 //     builder: (builder) => ShowForm());
              //               },
              //               imageAsset: "assets/images/eempty box.png",
              //               buttonTitle: 'New Message',
              //               textTitle:
              //                   'Ouch! It looks like there are no messages available here yet.'),
              //         )
              //       ]),
              // ),

              Row(
                children: [
                  Obx(() => controller.screen[controller.selectedIndex.value]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageNavTab extends StatelessWidget {
  MessageNavTab(
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
      padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: GlobalColors.dividerLine),
            color: selected == false
                ? GlobalColors.whiteText
                : GlobalColors.backgroundgray,
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
                      : GlobalColors.DarkBorder,
                )),
          ),
        ),
      ),
    );
  }
}

class MessageNavTab2 extends StatelessWidget {
  MessageNavTab2(
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
      padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: GlobalColors.dividerLine),
            color: selected == false
                ? GlobalColors.whiteText
                : GlobalColors.backgroundgray,
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
                      : GlobalColors.DarkBorder,
                )),
          ),
        ),
      ),
    );
  }
}

class MessageNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    AllMessagesScreen(),
    InboxMessagesScreen(),
    SentMessagesScreen(),
    RecivedMessagesScreen(),
    DraftMessagesScreen(),
  ];
}
