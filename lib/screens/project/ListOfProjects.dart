import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/project/create_project_dialog.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/projectcontroller.dart';
import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:codegraniteflutter/widgets/dropdownBox/twoDropdownBox_widget.dart';
import 'package:codegraniteflutter/widgets/project/projectPage.dart';
import 'package:codegraniteflutter/widgets/searchBoxWidget/saerchBox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../widgets/containers/containrs_widegt.dart';

class ListOfProject extends StatefulWidget {
  const ListOfProject({super.key});

  @override
  State<ListOfProject> createState() => _ListOfProjectState();
}

class _ListOfProjectState extends State<ListOfProject> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    TextEditingController searchController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String dropdown = 'All Projects';
    int numberOfpages = 3;
    int currentPage = 0;

    var pages = List.generate(
        numberOfpages,
        (index) => ProjectPage(
              index: index,
            ));
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
          child: Row(children: [
            Expanded(
              child: EmptyContainer(
                width: 473,
                height: 45,
                boderColor: GlobalColors.lightBorder,
                child: SearchBox(
                  text: 'Search for clients...',
                  controller: searchController,
                  iconData: CupertinoIcons.search,
                  iconSize: 20,
                  keys: formKey,
                ),
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.filter_list,
                color: GlobalColors.DarkBorder,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Filter by',
                style: TextStyle(
                    color: GlobalColors.DarkBorder,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ]),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: DropDownMenu3(
                onchange: (newValue) {
                  setState(() {
                    dropdown = newValue;
                    print(newValue);
                  });
                },
                dropdown: dropdown,
                vale1: 'All Projects',
                text1: 'All Projects',
                vale2: 'Completed Projects',
                text2: 'Completed Projects',
                text3: 'In Progress',
                vale3: 'In Progress',
                text4: 'Pending Projects',
                vale4: 'Pending Projects',
              ),
            ),
            SizedBox(
              width: 40,
            ),
            SmallButton(
              buttonHeight: 56,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) => const CreateProjectDialog());
                print('Button tapped');
              },
              buttonWidth: 90,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.add,
                  color: GlobalColors.whiteText,
                  size: 20,
                ),
                Text(
                  'New Project',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      color: GlobalColors.whiteText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('30',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 9,
                            ),
                            Text('All Projects',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColors.dividerLine),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5), bottom: Radius.circular(5)),
                    ),
                    width: 214),
              ),
              Flexible(
                child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('12',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 9,
                            ),
                            Text('Completed',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColors.dividerLine),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5), bottom: Radius.circular(5)),
                    ),
                    width: 214),
              ),
              Flexible(
                child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('10',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 9,
                            ),
                            Text('In Progress',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColors.dividerLine),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5), bottom: Radius.circular(5)),
                    ),
                    width: 214),
              ),
              Flexible(
                child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('08',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 9,
                            ),
                            Text('Pending',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColors.dividerLine),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5), bottom: Radius.circular(5)),
                    ),
                    width: 214),
              )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            child: Container(
                child: Column(
                  children: [
                    Center(child: pages[currentPage]),
                    SizedBox(
                      height: 80,
                    ),
                    NumberPagination(
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index - 1;
                          });
                        },
                        iconNext: Container(
                          width: 70,
                          height: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: GlobalColors.dividerLine),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5),
                                bottom: Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        controlButton: Container(),
                        iconToFirst: Container(),
                        iconToLast: Container(),
                        colorPrimary: GlobalColors.buttonBlue,
                        colorSub: GlobalColors.whiteText,
                        // pageInit: 1,
                        iconPrevious: Container(
                          width: 97,
                          height: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: GlobalColors.dividerLine),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5),
                                bottom: Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back),
                              Text("Previous",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        ),
                        pageTotal: numberOfpages)
                  ],
                )
                // Center(
                //   child: Column(children: [
                //     Padding(
                //       padding: EdgeInsets.only(top: 55, bottom: 35),
                //       child: ImageConainerWithAddProjectButton2(
                //           ontap: () {
                //             // showDialog(
                //             //     context: context,
                //             //     builder: (builder) => ShowForm());
                //           },
                //           imageAsset: "assets/images/eempty box.png",
                //           buttonTitle: 'New Project',
                //           textTitle:
                //               'Ouch! It looks like there are no project available here yet'),
                //     )
                //   ]),
                // ),
                ,
                decoration: BoxDecoration(
                  border: Border.all(color: GlobalColors.dividerLine),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5), bottom: Radius.circular(5)),
                ),
                width: 1091),
          ),
        )
      ]),
    );
  }
}
