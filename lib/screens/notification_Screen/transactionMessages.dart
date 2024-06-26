import 'package:codegraniteflutter/widgets/messages_widgets/transactionMessages_widget.dart';
import 'package:flutter/material.dart';

class TransactionMessagesScreen extends StatelessWidget {
  const TransactionMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        // backgroundColor: GlobalColors.buttonBlue,
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            // itemExtent: 300,
            itemCount: 15,
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
                ],
              );
            }),
      ),
    );
  }
}
