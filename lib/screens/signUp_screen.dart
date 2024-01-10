import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/firstNav_Menu.dart';
import 'package:codegraniteflutter/screens/dashboard_Screen/Dashboard_screen.dart';
import 'package:codegraniteflutter/screens/Login_Screen.dart';
import 'package:codegraniteflutter/services/Apis/AuthApi/registerApi.dart';
// import 'package:codegraniteflutter/seodNav.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';
import 'package:codegraniteflutter/widgets/snack_bars/snack_bar_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fullNamecontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  bool _isVisible = false;
  bool _isVisible1 = false;
  void _createUser() async {
    if (formKey.currentState!.validate() &&
        formKey1.currentState!.validate() &&
        formKey2.currentState!.validate() &&
        formKey3.currentState!.validate() &&
        formKey4.currentState!.validate()) {
      final registerAuth =
          Provider.of<RegisterApiProvider>(context, listen: false);
      registerAuth
          .registerUser(
              fullNamecontroller.text.toString(),
              emailcontroller.text.toString(),
              phoneNumbercontroller.text.toString(),
              passwordcontroller.text.toString())
          .then((value) {
        if (value.success == true) {
          success(context: context, message: value.message);
          Get.to(() => LoginScreen());
        } else {
          error(context: context, message: value.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerAuth = Provider.of<RegisterApiProvider>(context);
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 155,
                  height: 53,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/codegranitesimg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text("Register",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("let’s get started",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(70.0),
                          child: Column(
                            children: <Widget>[
                              textFiled(
                                  keys: formKey,
                                  label: "Full Name",
                                  hintText: "Full Name",
                                  controller2: fullNamecontroller,
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value!)) {
                                      return "Enter Your Full Name";
                                    } else {
                                      return null;
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              textFiled(
                                  keys: formKey1,
                                  label: "Phone NUMBER",
                                  hintText: "Phone Number",
                                  controller2: phoneNumbercontroller,
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                            .hasMatch(value!)) {
                                      return "Enter Your Phone Number";
                                    } else {
                                      return null;
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              textFiled(
                                  keys: formKey2,
                                  label: "Business Email",
                                  hintText: "Enter Business Email Address",
                                  suffixIcon2: const Icon(CupertinoIcons.mail),
                                  controller2: emailcontroller,
                                  keyboardType4: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                            .hasMatch(value!)) {
                                      return "Enter Your email";
                                    } else {
                                      return null;
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              textFiled(
                                  keys: formKey3,
                                  label: "Password",
                                  hintText: "Enter password",
                                  controller2: passwordcontroller,
                                  obscureText: !_isVisible,
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^.*$').hasMatch(value!)) {
                                      return "Enter Your Password";
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
                                  keys: formKey4,
                                  label: "Confirm Password",
                                  hintText: "Re-enter password",
                                  controller2: confirmpasswordController,
                                  obscureText: !_isVisible1,
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^.*$').hasMatch(value!)) {
                                      return "Enter Your ComfirmPassword";
                                    } else if (passwordcontroller
                                            .text.isEmpty ||
                                        confirmpasswordController
                                            .text.isEmpty) {
                                      return 'Both fields are required.';
                                    } else if (passwordcontroller.text !=
                                        confirmpasswordController.text) {
                                      return 'Passwords do not match.';
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
                                buttonWidth: 700,
                                buttonHeight: 50,
                                text: registerAuth.loading
                                    ? 'Loading'
                                    : 'Sign Up',
                                onPressed: () {
                                  // print("done");
                                  _createUser();
                                  // Get.to(NavigationMenue());
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Divider(
                                      color: GlobalColors.dividerLine,
                                      thickness: 6,
                                      height: 10,
                                    ),
                                    Text("or",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Divider(
                                      color: GlobalColors.dividerLine,
                                      thickness: 6,
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    print(' contuninu');
                                  },
                                  child: EmptyContainer(
                                    boderColor: GlobalColors.lightBorder,
                                    width: 580,
                                    height: 64,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/images/flatcoloriconsgoogle.png'),
                                            Text("Continue with Google",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text("Already have an account?",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => LoginScreen());
                                    },
                                    child: Text("Login",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: GlobalColors.buttonBlue,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Container(
                      width: 818,
                      height: 700,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/displaypeople.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
