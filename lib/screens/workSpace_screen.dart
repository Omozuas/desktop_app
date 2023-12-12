import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:codegraniteflutter/widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';
import 'package:codegraniteflutter/widgets/showDialog/deleteWorkSpace.dart';
import 'package:flutter/material.dart';

class WorkSpaceScreen extends StatefulWidget {
  const WorkSpaceScreen({super.key});

  @override
  State<WorkSpaceScreen> createState() => _WorkSpaceScreenState();
}

class _WorkSpaceScreenState extends State<WorkSpaceScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: GlobalColors.whiteText,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 0, bottom: 40),
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
                                  Text(
                                      "Choose a logo for your workspace. Recommended size is 256 x 256",
                                      softWrap: true,
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
                          label: 'Workspace Name',
                          hintText: 'Code granites',
                          controller2: fullNameController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                              return "Workspace Name";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      textFiled(
                          keys: formKey1,
                          label: 'Workspace Url',
                          hintText: 'Codegranites.app/Code granites',
                          controller2: usernameController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w\s.,#-]+$').hasMatch(value!)) {
                              return "Enter Your Workspace Url";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TransparentButton(
                            onPressed: () {},
                            buttonHeight: 56,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: GlobalColors.whiteText,
                                ),
                                Text("Copy",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: GlobalColors.whiteText,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                            buttonWidth: 106,
                            backgroundcolor: GlobalColors.buttonBlue,
                            borderColor: GlobalColors.buttonBlue,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      LargButton(
                        buttonHeight: 56,
                        buttonWidth: 200,
                        onPressed: () {},
                        text: 'Update',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: GlobalColors.dividerLine,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          "If you want to permanently delete this workspace and all its data, including but no limited to users, Problem statements, projects click the button below",
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14,
                            color: GlobalColors.DarkBorder,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      TransparentButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => DeleteWorkSpace());
                        },
                        buttonHeight: 56,
                        child: Text("Delete Workspace ",
                            style: TextStyle(
                              fontSize: 14,
                              color: GlobalColors.errorRed,
                              fontWeight: FontWeight.w500,
                            )),
                        buttonWidth: 206,
                        backgroundcolor: GlobalColors.whiteText,
                        borderColor: GlobalColors.errorRed,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
