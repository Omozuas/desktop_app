// import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
// import 'package:codegraniteflutter/screens/Dashboard_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class NavigationMenue extends StatelessWidget {
//   const NavigationMenue({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//     bool selected = false;

//     return Scaffold(
//         body: Row(children: [
//       Container(
//           height: double.infinity,
//           width: 250,
//           color: GlobalColors.whiteText,
//           child: SingleChildScrollView(
//             physics: AlwaysScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 21, right: 1),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20.0, bottom: 20),
//                       child: Container(
//                         width: 155,
//                         height: 53,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           image: DecorationImage(
//                             image:
//                                 AssetImage('assets/images/codegranitesimg.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     ListView(
//                       children: [],
//                     )
//                   ]),
//             ),
//           )),
//       Expanded(
//           child: Row(
//         children: [
//           VerticalDivider(
//             width: 1,
//             thickness: 1,
//             color: GlobalColors.dividerLine,
//           ),
//           Obx(() => controller.screen[controller.selectedIndex.value])
//         ],
//       ))
//     ]));
//   }
// }

// class NavMenueTab extends StatefulWidget {
//   NavMenueTab(
//       {super.key,
//       this.height,
//       this.width,
//       required this.onTap,
//       required this.iconData,
//       required this.title,
//       required this.selected});
//   double? width;
//   double? height;
//   IconData iconData;
//   VoidCallback onTap;
//   String title;
//   int selected;
//   bool? index;
//   @override
//   State<NavMenueTab> createState() => _NavMenueTabState();
// }

// class _NavMenueTabState extends State<NavMenueTab> {
//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0, bottom: 5),
//       child: Container(
//         width: widget.width,
//         height: widget.height,
//         decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: widget.selected == 0
//                 ? GlobalColors.buttonBlue
//                 : GlobalColors.whiteText,
//             borderRadius: BorderRadiusDirectional.all(Radius.circular(5))),
//         child: Center(
//           child: ListTile(
//             onTap: () {},
//             leading: Icon(
//               widget.iconData,
//               color: widget.selected == 0
//                   ? GlobalColors.whiteText
//                   : GlobalColors.DarkBorder,
//               size: 28,
//             ),
//             title: Text(widget.title,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: widget.selected == 0
//                       ? GlobalColors.whiteText
//                       : GlobalColors.DarkBorder,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//   final screen = [
//     DashboardScreen(),
//     Container(color: Colors.black),
//     Container(color: Colors.red),
//     Container(color: Colors.blue),
//   ];
// }

// // List demoMainSide = [
// //   NavMenueTab(
// //       iconData: Icons.dashboard_outlined,
// //       onTap: () {},
// //       width: 245,
// //       height: 47,
// //       title: 'Dashboard',
// //       selected: 0),
// //   NavMenueTab(
// //     iconData: CupertinoIcons.doc_text,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Workspaces',
// //     selected: 2,
// //   ),
// //   NavMenueTab(
// //     iconData: CupertinoIcons.question_square,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Problem Statements',
// //     selected: 3,
// //   ),
// //   NavMenueTab(
// //     iconData: Icons.work_outline_rounded,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Projects',
// //     selected: 4,
// //   ),
// //   NavMenueTab(
// //     iconData: CupertinoIcons.person_3,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Clients',
// //     selected: 5,
// //   ),
// //   NavMenueTab(
// //     iconData: Icons.receipt_long_sharp,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Transactions',
// //     selected: 6,
// //   ),
// //   NavMenueTab(
// //     iconData: CupertinoIcons.chat_bubble_text,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Message',
// //     selected: 7,
// //   ),
// //   NavMenueTab(
// //     iconData: Icons.badge_outlined,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Admins',
// //     selected: 8,
// //   ),
// //   NavMenueTab(
// //     iconData: CupertinoIcons.bell,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Notification',
// //     selected: 9,
// //   ),
// //   NavMenueTab(
// //     iconData: Icons.add_circle_outline,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Invite',
// //     selected: 10,
// //   ),
// //   SizedBox(
// //     height: 20,
// //   ),
// //   Divider(
// //     height: 1,
// //     thickness: 1,
// //     color: GlobalColors.dividerLine,
// //   ),
// //   SizedBox(
// //     height: 20,
// //   ),
// //   NavMenueTab(
// //     iconData: CupertinoIcons.gear,
// //     onTap: () {},
// //     width: 245,
// //     height: 47,
// //     title: 'Settings',
// //     selected: 11,
// //   ),
// //   SizedBox(
// //     height: 20,
// //   ),
// //   Padding(
// //     padding: const EdgeInsets.only(bottom: 20.0),
// //     child: NavMenueProfile(
// //       onTap: () {},
// //       image: 'assets/images/Image.png',
// //       name: "Jane Doe",
// //       email: "JohnDoe@gmail",
// //     ),
// //   ),
// // ];
