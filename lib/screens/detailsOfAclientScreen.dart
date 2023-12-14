import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/clienController.dart';
import 'package:codegraniteflutter/widgets/showDialog/removeClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsOfAclientScreen extends StatefulWidget {
  const DetailsOfAclientScreen({super.key});

  @override
  State<DetailsOfAclientScreen> createState() => _DetailsOfAclientScreenState();
}

class _DetailsOfAclientScreenState extends State<DetailsOfAclientScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClientController());
    return Expanded(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      controller.selectedIndex.value = 0;
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text("Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 35, right: 30, top: 30, bottom: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/presonn1.png',
                                        ),
                                        fit: BoxFit.cover),
                                    border: Border.all(
                                        color: GlobalColors.dividerLine),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(5),
                                        bottom: Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Karl Mbemba",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Row(
                                  children: [
                                    Text("Title:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("CEO Quest",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Client ID:",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("Ad4 - 0102",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Email:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Flexible(
                                      child: Text("karlmbemba@gmail.com",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Phone:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("00000000000",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Gender:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("Male",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Nationality:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("American",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Texas",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("Texas",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Address:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Flexible(
                                      child: Text(
                                          " 101 Main Street, Apartment 123, Austin, TX 78731",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bio:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                'Im Karl, the CEO of Quest, where we breathe life into ideas and drive the future of technology. Exciting times lie ahead as we embark on a transformative journey with CodeGranites, using their cutting-edge project management web app to steer our latest venture At the helm of Quest, Ive set sail on a mission to redefine industry standards. Our collaboration with CodeGranites is a testament to our commitment to excellence. The vision is simple yet profound  to harness technology for unparalleled innovation',
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: GlobalColors.dividerLine),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5), bottom: Radius.circular(5)),
                ),
                width: 1100),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => RemoveClient());
                    },
                    icon: Icon(
                      CupertinoIcons.trash,
                      size: 20,
                      color: GlobalColors.errorRed,
                    )),
                Text("Remove client from workspace",
                    style: TextStyle(
                      fontSize: 12,
                      color: GlobalColors.errorRed,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
          )
        ],
      ))),
    );
  }
}
