import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/imageContainee/imagerContainerWithText_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/LargButton_widget.dart';
import '../loginAndSignUP_widget/textFieldWithLabel_widget.dart';

class NumberBox extends StatefulWidget {
  NumberBox({
    super.key,
  });

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController phoneNumbercontroller = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: _scaffoldkey,
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 406,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28.0, left: 28, right: 28, bottom: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 78,
                    height: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/codegranitesimg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              ImageContainerWithText(
                  height: 227,
                  width: 260,
                  imageAsset: "assets/images/keyys.png",
                  text:
                      'Enter the phone number you want to receive a log in code on  ',
                  padding: EdgeInsets.only(bottom: 5)),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Country",
                            style: TextStyle(
                              fontSize: 14,
                              color: GlobalColors.DarkBorder,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: EmptyContainer(
                            width: 107,
                            height: 45,
                            boderColor: GlobalColors.dividerLine,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                ),
                                child: CountryCodePicker(
                                  initialSelection: 'Ng',
                                  showDropDownButton: true,
                                  showFlag: false,
                                  onChanged: (CountryCode code) {
                                    print(code);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 170,
                      child: textFiled(
                          keys: formKey1,
                          label: "Phone NUMBER",
                          hintText: "Enter your phone number",
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: LargButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonHeight: 56,
                  buttonWidth: 345,
                  text: "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
