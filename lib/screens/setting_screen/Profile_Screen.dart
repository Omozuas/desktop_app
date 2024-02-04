import 'dart:io';

import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:codegraniteflutter/widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    final formKey = GlobalKey<FormState>();
    final formKey1 = GlobalKey<FormState>();
    final formKey2 = GlobalKey<FormState>();
    final formKey3 = GlobalKey<FormState>();
    final formKey4 = GlobalKey<FormState>();
    final formKey5 = GlobalKey<FormState>();

    TextEditingController fullNameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController jobTitleController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    String? dropdown = 'Select Gender';
    File? _pickedImage;
    Future<void> _imagePicker() async {
      final FilePickerResult? picker = await FilePicker.platform.pickFiles(
          type: FileType.image, allowedExtensions: ['jpg', 'jpeg', 'png']);

      if (picker != null) {
        PlatformFile file = picker.files.single;
        setState(() {
          _pickedImage = File(file.path!);
        });

        print(file.bytes);
        print(_pickedImage!.path);
        print(file.bytes);
        print(file.extension);
      } else {
        print("no image has been picked");
      }
    }

    return Flexible(
      child: Scaffold(
        key: scaffoldkey,
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
                                    onPressed: () {
                                      _imagePicker();
                                    },
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
                      largTextFiled(
                          keys: formKey4,
                          label: 'Bio',
                          hintText: 'Write about yourself...',
                          controller2: bioController,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 16,
                              color: GlobalColors.DarkBorder,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 580,
                            padding: EdgeInsets.only(left: 6, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: GlobalColors.lightBorder,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(10),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 36,
                              elevation: 0,
                              isExpanded: true,
                              focusColor: GlobalColors.whiteText,
                              dropdownColor: Colors.white,
                              onChanged: (String? nwvalue) {
                                dropdown = nwvalue;
                                print(nwvalue);
                                // setState(() {
                                //   dropdown = nwvalue;
                                //   print(nwvalue);
                                // });
                              },
                              value: dropdown,
                              items: [
                                DropdownMenuItem<String>(
                                    value: 'Select Gender',
                                    child: Text('Select Gender',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ))),
                                DropdownMenuItem<String>(
                                    value: 'Female',
                                    child: Text('Female',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ))),
                                DropdownMenuItem<String>(
                                    value: 'Male',
                                    child: Text('Male',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
                                    width: 140,
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
                            Flexible(
                              child: Container(
                                width: 420,
                                child: textFiled(
                                    keys: formKey5,
                                    label: "Phone NUMBER",
                                    hintText: "Enter your phone number",
                                    controller2: phoneNumberController,
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
                            ),
                          ],
                        ),
                      ),
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
                      CSCPicker(
                        layout: Layout.vertical,
                        onCityChanged: (city) {},
                        flagState: CountryFlag.ENABLE,
                        onCountryChanged: (country) {},
                        onStateChanged: (state) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textFiled(
                          keys: formKey1,
                          label: 'Address',
                          hintText: 'Address',
                          controller2: usernameController,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w\s.,#-]+$').hasMatch(value!)) {
                              return "Enter YourAddress";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 20,
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
