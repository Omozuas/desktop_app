import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/dropdownBox/dropdownBox.dart';
import 'package:codegraniteflutter/widgets/showDialog/deleteAccount.dart';
import 'package:flutter/material.dart';

class AccountPrefrenceScreen extends StatefulWidget {
  const AccountPrefrenceScreen({super.key});

  @override
  State<AccountPrefrenceScreen> createState() => _AccountPrefrenceScreenState();
}

class _AccountPrefrenceScreenState extends State<AccountPrefrenceScreen> {
  @override
  Widget build(BuildContext context) {
    String value = 'English';
    String dropdown = 'Light mode';
    return Flexible(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 30),
              child: Container(
                width: 520,
                child: Column(
                  children: [
                    DropDownMenu(
                      label: "Language",
                      onchange: (newValue) {
                        setState(() {
                          value = newValue;
                          print(newValue);
                        });
                      },
                      dropdown: value,
                      vale1: 'Chinese',
                      text1: 'Chinese',
                      vale2: 'English',
                      text2: 'English',
                      vale3: 'French',
                      text3: 'French',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    DropDownMenu(
                      label: "Theme",
                      onchange: (newValue) {
                        setState(() {
                          dropdown = newValue;
                          print(newValue);
                        });
                      },
                      dropdown: dropdown,
                      vale1: 'Dark mode',
                      text1: 'Dark mode',
                      vale2: 'Light mode',
                      text2: 'Light mode',
                      vale3: 'Match browser',
                      text3: 'Match browser',
                    ),
                    SizedBox(
                      height: 300,
                    ),
                    Center(
                      child: TransparentButton(
                          buttonHeight: 56,
                          buttonWidth: 206,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => DeleteAccountBox());
                          },
                          backgroundcolor: GlobalColors.whiteText,
                          borderColor: GlobalColors.errorRed,
                          child: Text("Delete Account",
                              style: TextStyle(
                                fontSize: 14,
                                color: GlobalColors.errorRed,
                                fontWeight: FontWeight.w500,
                              ))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
