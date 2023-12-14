import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowForm extends StatefulWidget {
  const ShowForm({super.key});

  @override
  State<ShowForm> createState() => _ShowFormState();
}

class _ShowFormState extends State<ShowForm> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController clientNamecontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController companynameController = TextEditingController();
  TextEditingController companywebsiteController = TextEditingController();
  TextEditingController projecttitleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: _scaffoldkey,
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 686,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 28.0, left: 28, right: 28, bottom: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Client",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: GlobalColors.DarkBorder,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  color: GlobalColors.whiteText,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    color: GlobalColors.iconDarkColor,
                                    icon: Icon(Icons.add)),
                              ),
                              Text('Upload Profile photo')
                            ],
                          ),
                          width: 224,
                          height: 282,
                          decoration: BoxDecoration(
                            color: GlobalColors.lightgray,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5),
                                bottom: Radius.circular(5)),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        textFiled(
                            keys: formKey,
                            label: "Client name",
                            hintText: "Enter name",
                            controller2: clientNamecontroller,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                return "Enter Client name";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        textFiled(
                            keys: formKey1,
                            label: "Title",
                            hintText: "e.g CEO",
                            controller2: titleController,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                return "Enter Title";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        textFiled(
                            keys: formKey2,
                            label: "Emaill address",
                            hintText: "Enter email",
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
                            label: "Phone number",
                            hintText: "Enter number",
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
                            keys: formKey4,
                            label: "Company name",
                            hintText: "Enter name",
                            controller2: companynameController,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                return "Enter Company name";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        textFiled(
                            keys: formKey5,
                            label: "Company website",
                            hintText: "Enter website",
                            controller2: companywebsiteController,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^.*$').hasMatch(value!)) {
                                return "Enter website";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        textFiled(
                            keys: formKey6,
                            label: "Project title",
                            hintText: "Enter title",
                            controller2: projecttitleController,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                return "Enter Project title";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: LargButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        buttonHeight: 56,
                        buttonWidth: 135,
                        text: "Save",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
