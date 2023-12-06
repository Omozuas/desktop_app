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
              padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Welcome Back!,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Jane',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: GlobalColors.dividerLine,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
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
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, top: 15, right: 30, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.work_outline_rounded,
                                        color: GlobalColors.iconDarkColor,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Available Projects',
                                        style: TextStyle(
                                            color:
                                                GlobalColors.foundationblack500,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          color: GlobalColors.iconDarkColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Filter ',
                                          style: TextStyle(
                                              color: GlobalColors
                                                  .foundationblack500,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemExtent: 700,
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0,
                                                  top: 0,
                                                  right: 30,
                                                  bottom: 15),
                                              child: Container(
                                                width: 421,
                                                height: 342,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/frameProject.png'),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text("You have to projects yet!",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SmallButton(
                                              width: 160,
                                              buttonHeight: 56,
                                              onPressed: () {},
                                              buttonWidth: 100,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: GlobalColors
                                                          .whiteText,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      'New project',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color: GlobalColors
                                                              .whiteText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  VerticalDivider(
                    width: 1,
                    color: GlobalColors.dividerLine,
                    thickness: 2,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 15, right: 10, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.receipt_long,
                                    color: GlobalColors.DarkBorder,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'History',
                                    style: TextStyle(
                                        color: GlobalColors.DarkBorder,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View all',
                                      style: TextStyle(
                                          color: GlobalColors.DarkBorder,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: GlobalColors.DarkBorder,
                                      size: 20,
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 208,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemExtent: 300,
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0,
                                              top: 10,
                                              right: 30,
                                              bottom: 15),
                                          child: Container(
                                            width: 168,
                                            height: 136,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/frameProject2.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Oops! There are no completed projects yet",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            Divider(),
                            Expanded(
                                child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      top: 15,
                                      right: 10,
                                      bottom: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.receipt_long,
                                              color: GlobalColors.DarkBorder,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Transactions',
                                              style: TextStyle(
                                                  color:
                                                      GlobalColors.DarkBorder,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ]),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'View all',
                                                style: TextStyle(
                                                    color:
                                                        GlobalColors.DarkBorder,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: GlobalColors.DarkBorder,
                                                size: 20,
                                              ),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 208,
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemExtent: 300,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30.0,
                                                            top: 10,
                                                            right: 30,
                                                            bottom: 15),
                                                    child: Container(
                                                      width: 168,
                                                      height: 136,
                                                      decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/frameProject3.png'),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "No transactions have been made yet!",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
