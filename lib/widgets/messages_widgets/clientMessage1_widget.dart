import 'package:flutter/material.dart';

class ClientsMessages extends StatelessWidget {
  ClientsMessages(
      {super.key,
      required this.messageFrom,
      required this.theMessage,
      required this.time,
      required this.padding});
  String messageFrom, theMessage, time;
  EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(messageFrom,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  )),
              SizedBox(
                width: 7,
              ),
              Text(theMessage,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          Flexible(
            child: Text(time,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      ),
    );
  }
}
