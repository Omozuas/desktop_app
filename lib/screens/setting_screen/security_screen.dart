import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/showDialog/twoStepVerificationDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool _isVisible = false;
  bool _isVisible1 = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          key: _scaffoldkey,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Center(
                child: Container(
                  width: 520,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Change your password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        textFiled(
                            keys: formKey,
                            label: "Current password",
                            hintText: "Enter Current password",
                            controller2: passwordcontroller,
                            obscureText: !_isVisible,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^.*$').hasMatch(value!)) {
                                return "Enter Your Current password";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon2: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? const Icon(CupertinoIcons.eye)
                                  : const Icon(CupertinoIcons.eye_slash),
                              color: GlobalColors.DarkBorder,
                            ),
                            keyboardType4: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 30,
                        ),
                        textFiled(
                            keys: formKey1,
                            label: "New Password",
                            hintText: "Enter New password",
                            controller2: confirmpasswordController,
                            obscureText: !_isVisible1,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^.*$').hasMatch(value!)) {
                                return "Enter Your Current password";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon2: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible1 = !_isVisible1;
                                });
                              },
                              icon: _isVisible1
                                  ? const Icon(CupertinoIcons.eye)
                                  : const Icon(CupertinoIcons.eye_slash),
                              color: GlobalColors.DarkBorder,
                            ),
                            keyboardType4: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 30,
                        ),
                        LargButton(
                          onPressed: () {},
                          buttonHeight: 57,
                          buttonWidth: 206,
                          text: "Save changes",
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Divider(
                          color: GlobalColors.dividerLine,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text("Two step Verification",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                  "Protect your account with an extra layer of security.",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text("Learn More",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: GlobalColors.lightGreen,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => DeactivatUser());
                          },
                          child: Text("Configure two-step verification",
                              style: TextStyle(
                                fontSize: 14,
                                color: GlobalColors.lightGreen,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
