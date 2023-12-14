import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/imageContainee/imagerContainerWithText_widget.dart';
import 'package:codegraniteflutter/widgets/messages_widgets/client2Messages_wiget.dart';
import 'package:codegraniteflutter/widgets/messages_widgets/clientMessage1_widget.dart';
import 'package:codegraniteflutter/widgets/messages_widgets/commentMessages_widget.dart';
import 'package:codegraniteflutter/widgets/messages_widgets/generalMessages_widget.dart';
import 'package:codegraniteflutter/widgets/messages_widgets/transactionMessages_widget.dart';
import 'package:flutter/material.dart';

class AllNotificationScreen extends StatelessWidget {
  const AllNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        // backgroundColor: GlobalColors.buttonBlue,
        body: SingleChildScrollView(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                // itemExtent: 300,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      // Center(
                      //   child: ImageContainerWithText(
                      //       height: 512,
                      //       width: 649,
                      //       imageAsset: 'assets/images/eempty box.png',
                      //       text: 'You have no notifications yet',
                      //       padding: EdgeInsets.zero),
                      // )
                      TransactionMessages(
                        text1: 'John doe just made a payment of NGN100,000',
                        text2: "2 Nov, 2023, 11:30 AM",
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 5, right: 30, bottom: 5),
                      ),
                      Divider(),
                      GeneralMessages(
                        messageFrom: "Message from john doe",
                        theMessage:
                            "Please i would like to negotiate the price",
                        time: "2 Nov, 2023, 11:30 AM",
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 5, right: 30, bottom: 5),
                      ),
                      Divider(),
                      CommentsMessages(
                        messageFrom:
                            "John doe just dropped a comment on John doe project",
                        theMessage:
                            "Please i would like to negotiate the price",
                        time: "2 Nov, 2023, 11:30 AM",
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 5, right: 30, bottom: 5),
                      ),
                      Divider(),
                      CommentsMessages(
                        messageFrom: "You were tagged",
                        theMessage:
                            "Please i would like to negotiate the price",
                        time: "2 Nov, 2023, 11:30 AM",
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 5, right: 30, bottom: 5),
                      ),
                      Divider(),
                      ClientsMessages(
                        messageFrom: "John doe dropped a new problem statement",
                        theMessage:
                            "I need this kind of interaction on my project  ",
                        time: "2 Nov, 2023, 11:30 AM",
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 5, right: 30, bottom: 5),
                      ),
                      Divider(),
                      ClientsMessages2(
                        text1: 'John doe joined linear workspace',
                        text2: "2 Nov, 2023, 11:30 AM",
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 5, right: 30, bottom: 5),
                      ),
                      Divider(),
                    ],
                  );
                })),
      ),
    );
  }
}
