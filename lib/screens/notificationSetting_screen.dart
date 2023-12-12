import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class NotificationSeetingScreen extends StatefulWidget {
  const NotificationSeetingScreen({super.key});

  @override
  State<NotificationSeetingScreen> createState() =>
      _NotificationSeetingScreenState();
}

class _NotificationSeetingScreenState extends State<NotificationSeetingScreen> {
  bool isOn = false;
  bool receivenotificationsinEmail = false;
  bool receivenotificationsforComments = false;
  bool receivenotificationsformessage = false;
  bool receivenotificationsforTransactions = false;
  bool receivenotificationsforclients = false;
  bool? problemstatements = false;
  bool? acceptsinvites = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          backgroundColor: GlobalColors.whiteText,
          body: SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 20, left: 20),
              child: Container(
                width: 427,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text("Receive notifications in Email",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              receivenotificationsinEmail = value;
                            });
                          },
                          splashRadius: 0,
                          trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                            return GlobalColors.dividerLine;
                          }),
                          value: receivenotificationsinEmail,
                          activeColor: GlobalColors.whiteText,
                          activeTrackColor: GlobalColors.buttonBlue,
                          inactiveTrackColor: GlobalColors.lightgray,
                          inactiveThumbColor: GlobalColors.whiteText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: GlobalColors.dividerLine,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Receive notifications for message',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              receivenotificationsformessage = value;
                            });
                          },
                          splashRadius: 0,
                          trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                            return GlobalColors.dividerLine;
                          }),
                          value: receivenotificationsformessage,
                          activeColor: GlobalColors.whiteText,
                          activeTrackColor: GlobalColors.buttonBlue,
                          inactiveTrackColor: GlobalColors.lightgray,
                          inactiveThumbColor: GlobalColors.whiteText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Receive notifications for Comments',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              receivenotificationsforComments = value;
                            });
                          },
                          trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                            return GlobalColors.dividerLine;
                          }),
                          splashRadius: 0,
                          value: receivenotificationsforComments,
                          activeColor: GlobalColors.whiteText,
                          activeTrackColor: GlobalColors.buttonBlue,
                          inactiveTrackColor: GlobalColors.lightgray,
                          inactiveThumbColor: GlobalColors.whiteText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Receive notifications for Transactions',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              receivenotificationsforTransactions = value;
                            });
                          },
                          splashRadius: 0,
                          trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                            return GlobalColors.dividerLine;
                          }),
                          value: receivenotificationsforTransactions,
                          activeColor: GlobalColors.whiteText,
                          activeTrackColor: GlobalColors.buttonBlue,
                          inactiveTrackColor: GlobalColors.lightgray,
                          inactiveThumbColor: GlobalColors.whiteText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Receive notifications for clients',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              receivenotificationsforclients = value;
                            });
                          },
                          value: receivenotificationsforclients,
                          activeColor: GlobalColors.whiteText,
                          activeTrackColor: GlobalColors.buttonBlue,
                          inactiveTrackColor: GlobalColors.lightgray,
                          inactiveThumbColor: GlobalColors.whiteText,
                          splashRadius: 0,
                          trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                            return GlobalColors.dividerLine;
                          }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Accepts invites',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        Checkbox(
                            tristate: false,
                            activeColor: GlobalColors.buttonBlue,
                            value: acceptsinvites,
                            splashRadius: 0,
                            side: BorderSide(color: GlobalColors.dividerLine),
                            onChanged: (value) {
                              setState(() {
                                acceptsinvites = value;
                              });
                              print(value);
                            })
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Problem statements',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        Checkbox(
                            tristate: false,
                            activeColor: GlobalColors.buttonBlue,
                            side: BorderSide(color: GlobalColors.dividerLine),
                            value: problemstatements,
                            splashRadius: 0,
                            onChanged: (value) {
                              setState(() {
                                problemstatements = value;
                              });
                              print(value);
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ))),
    );
  }
}
