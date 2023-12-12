import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/showDialog/protectectAccoutbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/LargButton_widget.dart';
import '../loginAndSignUP_widget/textFieldWithLabel_widget.dart';

class DeactivatUser extends StatefulWidget {
  DeactivatUser({
    super.key,
  });

  @override
  State<DeactivatUser> createState() => _DeactivatUserState();
}

class _DeactivatUserState extends State<DeactivatUser> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController passwordcontroller = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  bool _isVisible1 = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: _scaffoldkey,
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 407,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Two step Verification",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          )),
                      Text("Please input your password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              textFiled(
                  keys: formKey1,
                  label: "Password",
                  hintText: "Enter password",
                  controller2: passwordcontroller,
                  obscureText: !_isVisible1,
                  validate: (value) {
                    if (value!.isEmpty || !RegExp(r'^.*$').hasMatch(value!)) {
                      return "Enter Your password";
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
                onPressed: () {
                  if (formKey1.currentState!.validate()) {
                    print(passwordcontroller.text);
                    Navigator.pop(context);
                    showDialog(
                        context: context, builder: (context) => ProtectBox());
                  }
                },
                buttonHeight: 56,
                buttonWidth: 345,
                text: "Continue",
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
