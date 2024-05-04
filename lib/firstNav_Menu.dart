import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/Login_Screen.dart';
import 'package:codegraniteflutter/screens/inviteScreen/invite_dialog.dart';
import 'package:codegraniteflutter/services/Apis/GetInfoFromApi/getUserById.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/NavController.dart';
import 'package:codegraniteflutter/widgets/navProfileMenue_widget/navProfileMenue_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/NavTabMenue/MainNavTab_wideget.dart';

class NavigationMenue extends StatefulWidget {
  const NavigationMenue({super.key});

  @override
  State<NavigationMenue> createState() => _NavigationMenueState();
}

class _NavigationMenueState extends State<NavigationMenue> {
  var token;
  var id;
  String fullname = '';
  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // decodeToken();
  }

  Future<void> decodeToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    print("see1: $token");

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
    setState(() {
      id = jwtDecodedToken['accountId'];
    });
    print("see1: $jwtDecodedToken");
    print(id);
    getClientInfByid();
  }

  Future<void> getClientInfByid() async {
    final getInfo = Provider.of<GetUserApiProvider>(context, listen: false);
    getInfo.getClientById(token, id).then((value) {
      setState(() {
        fullname = value.fullName;
        email = value.email;
      });
    });
  }

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
            physics: const AlwaysScrollableScrollPhysics(),
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
                        decoration: const BoxDecoration(
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
                              onTap: () {
                                // I added a show dialog here to make it a popup when the invite button is tapped
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        content: InviteDialog(),
                                      );
                                    });
                              },
                              // => controller.selectedIndex.value = 7,
                              selected: controller.selectedIndex.value == 7,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: GlobalColors.dividerLine,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            NavMenueTab(
                              iconData: CupertinoIcons.gear,
                              width: 245,
                              height: 47,
                              title: 'Settings',
                              onTap: () => controller.selectedIndex.value = 8,
                              selected: controller.selectedIndex.value == 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 5),
                              child: Container(
                                width: 245,
                                height: 47,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: GlobalColors.whiteText,
                                    borderRadius:
                                        const BorderRadiusDirectional.all(
                                            Radius.circular(5))),
                                child: Center(
                                  child: ListTile(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.clear();
                                      Get.to(() => const LoginScreen());
                                    },
                                    selected: false,
                                    leading: Icon(
                                      Icons.logout_sharp,
                                      color: GlobalColors.errorRed,
                                      size: 28,
                                    ),
                                    title: Text('Logout',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: GlobalColors.errorRed,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: NavMenueProfile(
                                onTap: () {},
                                image: 'assets/images/Image.png',
                                name: "$fullname",
                                email: "$email",
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
