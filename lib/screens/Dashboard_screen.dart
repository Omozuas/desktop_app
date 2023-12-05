import 'package:codegraniteflutter/widgets/buttons/LargButton_widget.dart';
import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colorsConstrain/colorsHex.dart';
import '../widgets/searchBoxWidget/saerchBox_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: GlobalColors.whiteText,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30, left: 30),
              child: Container(
                width: 270,
                height: 30,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Welcome Back!,',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          )),
                      Text('Jane',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: GlobalColors.dividerLine,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
              child: Row(children: [
                Flexible(
                  child: EmptyContainer(
                    width: 300,
                    height: 50,
                    boderColor: GlobalColors.lightBorder,
                    child: SearchBox(
                      text: 'Search project name...',
                      controller: searchController,
                      iconData: CupertinoIcons.search,
                      iconSize: 20,
                      keys: formKey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SmallButton(
                  buttonHeight: 56,
                  onPressed: () {},
                  buttonWidth: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: GlobalColors.whiteText,
                          size: 20,
                        ),
                        Text(
                          'New project',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              color: GlobalColors.whiteText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 10,
                ),
                TransparentButton(
                    buttonHeight: 56,
                    buttonWidth: 100,
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: GlobalColors.DarkBorder,
                            size: 20,
                          ),
                          Text(
                            'New project',
                            style: TextStyle(
                                color: GlobalColors.DarkBorder,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ]))
              ]),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: GlobalColors.dividerLine,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20, right: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.work_outline_rounded,
                                      color: GlobalColors.DarkBorder,
                                      size: 20,
                                    ),
                                    Text(
                                      'Available Projects',
                                      style: TextStyle(
                                          color: GlobalColors.DarkBorder,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ])
                            ],
                          )
                        ],
                      )
                    ],
                  )),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: GlobalColors.dividerLine,
                  ),
                  Expanded(child: Row())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
