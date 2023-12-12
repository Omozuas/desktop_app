import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:codegraniteflutter/widgets/showDialog/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProblemStatementScreen extends StatefulWidget {
  const ProblemStatementScreen({super.key});

  @override
  State<ProblemStatementScreen> createState() => _ProblemStatementScreenState();
}

class _ProblemStatementScreenState extends State<ProblemStatementScreen> {
  bool isExpanded1 = false;
  bool isExpanded3 = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderContainerTitle(title: 'Problem Statement'),
            Divider(),
            ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, left: 15, right: 15),
                        child: ExpansionPanelList(
                          materialGapSize: 2,
                          elevation: 0,
                          dividerColor: GlobalColors.DarkBorder,
                          expansionCallback: (inddex, isExpanded) {
                            setState(() {
                              if (index & inddex == 0) {
                                isExpanded1 = isExpanded;
                              }
                            });
                          },
                          children: [
                            ExpansionPanel(
                                isExpanded: isExpanded1,
                                headerBuilder: (contex, isExpanded) {
                                  return Row(
                                    children: [
                                      Text("John doe project",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: GlobalColors.DarkBorder,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 953,
                                          child: Text(
                                              "I would like for the footer to be bigger and the land page to be......",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                      ),
                                      Text("2 Nov, 2023, 11:30 AM",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  );
                                },
                                body: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Owner : john doe",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: GlobalColors
                                                          .DarkBorder,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                    "Created 2 Nov, 2023, 11:30 AM ",
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: GlobalColors
                                                          .dividerLine,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.edit_rounded,
                                                  color:
                                                      GlobalColors.buttonBlue,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                    "Edited 4 Nov, 2023, 11:30 AM",
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: GlobalColors
                                                          .buttonBlue,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                        TransparentButton(
                                            buttonHeight: 41,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      DetailAccountWorkInfo());
                                            },
                                            buttonWidth: 131,
                                            backgroundcolor:
                                                GlobalColors.whiteText,
                                            borderColor:
                                                GlobalColors.dividerLine,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.attach_file,
                                                  color: GlobalColors
                                                      .iconDarkColor,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("View Attached Files",
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: GlobalColors
                                                            .successGreen)),
                                              ],
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
                                    Text(
                                        "I would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism would like for the footer to be bigger and the land page to be more interesting add more pictures better colors smaller icons , styles like glass morphism",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }),
          ],
        )),
      ),
    );
  }
}
