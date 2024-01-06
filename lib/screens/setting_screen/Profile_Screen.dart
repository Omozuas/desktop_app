import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:codegraniteflutter/widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formKey1 = GlobalKey<FormState>();
    final formKey2 = GlobalKey<FormState>();
    final formKey3 = GlobalKey<FormState>();
    final formKey4 = GlobalKey<FormState>();
    final formKey5 = GlobalKey<FormState>();

    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

    TextEditingController fullNameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController jobTitleController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    return Expanded(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: GlobalColors.whiteText,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 0),
            child: Center(
              child: Container(
                width: 570,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CirclerImageContainer(
                                      image: 'assets/images/person7.png',
                                      width: 130,
                                      height: 130,
                                      circleZize: 100),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Email",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalColors.DarkBorder,
                                        fontWeight: FontWeight.w900,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("JohnDoes@gmail.com",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalColors.DarkBorder,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  TransparentButton(
                                    onPressed: () {},
                                    buttonHeight: 56,
                                    child: Text("Change Photo ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: GlobalColors.DarkBorder,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    buttonWidth: 206,
                                    backgroundcolor: GlobalColors.whiteText,
                                    borderColor: GlobalColors.dividerLine,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TransparentButton(
                                    onPressed: () {},
                                    buttonHeight: 56,
                                    child: Text("Delete Photo",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: GlobalColors.errorRed,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    buttonWidth: 206,
                                    backgroundcolor: GlobalColors.whiteText,
                                    borderColor: GlobalColors.dividerLine,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: GlobalColors.dividerLine,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textFiled(
                          keys: formKey,
                          label: 'Full Name',
                          hintText: 'Jane Doe',
                          controller2: fullNameController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                              return "Enter Your Full Name";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      textFiled(
                          keys: formKey1,
                          label: 'Username (What do you want to be called?)',
                          hintText: 'Jane Doe',
                          controller2: usernameController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w\s.,#-]+$').hasMatch(value!)) {
                              return "Enter Your Username";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      textFiled(
                          keys: formKey2,
                          label: 'Job title',
                          hintText: 'Designer',
                          controller2: jobTitleController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w\s.,#-]+$').hasMatch(value!)) {
                              return "Enter Job title";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      textFiled(
                          keys: formKey3,
                          label: 'Organisation',
                          hintText: 'Codegranite',
                          controller2: jobTitleController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w\s.,#-]+$').hasMatch(value!)) {
                              return "Enter Organisation";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      LargButton(
                        buttonHeight: 56,
                        buttonWidth: 206,
                        onPressed: () {},
                        text: 'Update profile',
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
