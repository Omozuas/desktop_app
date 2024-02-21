import 'dart:io';

import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:codegraniteflutter/widgets/loginAndSignUP_widget/textFieldWithLabel_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../colorsConstrain/colorsHex.dart';

class MessageBoxScreen extends StatefulWidget {
  const MessageBoxScreen({super.key});

  @override
  State<MessageBoxScreen> createState() => _MessageBoxScreenState();
}

class _MessageBoxScreenState extends State<MessageBoxScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool _showEmoji = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      elevation: 0,
      child: Container(
        width: 417,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        // color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 10, right: 20, bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CirclerImageContainer(
                        image: 'assets/images/person2.png',
                        width: 44,
                        circleZize: 50,
                        height: 44,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Boss Doe",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            CupertinoIcons.minus,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.square,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            CupertinoIcons.clear,
                          )),
                    ],
                  )
                ],
              ),
              Divider(
                color: GlobalColors.DarkBorder,
              ),
              Container(
                // width: 70,
                child: textFiled01(
                    keys: formKey1,
                    hintText: "To: youremaili@gmail.com",
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
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: 70,
                child: textFiled01(
                    keys: formKey,
                    hintText: "Subject: Project sample",
                    controller2: passwordcontroller,
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
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: 70,
                child: largTextFiled2(
                    keys: formKey2,
                    hintText: "Hey You There!",
                    controller2: messagecontroller,
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
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.attach_file,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showEmoji = !_showEmoji;
                          });
                        },
                        child: Icon(
                          Icons.emoji_emotions_outlined,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 109,
                    child: SmallButton(
                      buttonHeight: 50,
                      onPressed: () async {},
                      buttonWidth: 20,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.send,
                            //   color: GlobalColors.whiteText,
                            //   size: 15,
                            // ),
                            Image.asset('assets/images/send 1.png'),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Send',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  color: GlobalColors.whiteText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (_showEmoji)
                SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    textEditingController: messagecontroller,
                    config: Config(
                        searchViewConfig: SearchViewConfig(
                            backgroundColor: Colors.white,
                            buttonColor: Colors.black,
                            buttonIconColor: Colors.black),
                        emojiViewConfig: EmojiViewConfig(
                            columns: 7, backgroundColor: Colors.white),
                        skinToneConfig: SkinToneConfig(enabled: false),
                        bottomActionBarConfig: BottomActionBarConfig(
                            showBackspaceButton: false,
                            backgroundColor: Colors.white,
                            buttonColor: Colors.white,
                            buttonIconColor: Colors.black),
                        categoryViewConfig: CategoryViewConfig(
                            backgroundColor: Colors.white,
                            dividerColor: Colors.white)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
