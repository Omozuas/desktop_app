import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/firstNav_Menu.dart';
import 'package:codegraniteflutter/screens/dashboard_Screen/Dashboard_screen.dart';
import 'package:codegraniteflutter/screens/signUp_screen.dart';
import 'package:codegraniteflutter/widgets/snack_bars/snack_bar_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../services/Apis/AuthApi/registerApi.dart';
import '../widgets/buttons/LargButton_widget.dart';
import '../widgets/containers/containrs_widegt.dart';
import '../widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool _isVisible = false;

  Future<void> loginUsers() async {
    if (formKey.currentState!.validate() && formKey1.currentState!.validate()) {
      final loginAuth =
          Provider.of<RegisterApiProvider>(context, listen: false);
      loginAuth
          .loginUser(emailcontroller.text.toString(),
              passwordcontroller.text.toString())
          .then((value) {
        if (value.status == 'success') {
          Get.to(() => NavigationMenue());
          success(context: context, message: value.message);
        } else {
          error(context: context, message: value.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginAuth = Provider.of<RegisterApiProvider>(context);
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
                            Text("Welcome back !",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Great to have you back with us again ",
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
                                  keys: formKey1,
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
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text("Forgot password?",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('Reset');
                                    },
                                    child: Text("Reset",
                                        style: TextStyle(
                                          color: GlobalColors.buttonBlue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              LargButton(
                                buttonWidth: 700,
                                buttonHeight: 50,
                                text: 'Login',
                                // loginAuth.loading ? 'loading....' : 'Login',
                                onPressed: () {
                                  // Get.to(NavigationMenue());
                                  loginUsers();
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
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
                                  Text("Don’t have an account?",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => SignupScreen());
                                      },
                                      child: Text("Sign up",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: GlobalColors.buttonBlue,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
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
