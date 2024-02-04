import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:codegraniteflutter/widgets/client/pagesClient.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/dropdownBox/twoDropdownBox_widget.dart';
import 'package:codegraniteflutter/widgets/imageContainee/imagecontainerwithbutton2.dart';
import 'package:codegraniteflutter/widgets/searchBoxWidget/saerchBox_widget.dart';
import 'package:codegraniteflutter/widgets/showDialog/showForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';

class ListOfClientsScreen extends StatefulWidget {
  const ListOfClientsScreen({
    super.key,
  });

  @override
  State<ListOfClientsScreen> createState() => _ListOfClientsScreenState();
}

class _ListOfClientsScreenState extends State<ListOfClientsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String dropdown = 'All Clients';
  int numberOfpages = 3;
  int currentPage = 0;
  List<String> image = [
    'assets/images/person8.png',
    'assets/images/personn2.png',
    'assets/images/personn3.png',
    'assets/images/personn4.png',
    'assets/images/personn5.png',
    'assets/images/personn6.png'
  ];
  List<String> image2 = [
    'assets/images/personn6.png',
    'assets/images/person8.png',
    'assets/images/personn2.png',
    'assets/images/personn5.png',
    'assets/images/personn3.png',
    'assets/images/personn4.png'
  ];

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfpages,
        (index) => PagesClient(
              index: index,
              image: image,
              image2: image2,
              name: "Walter Kenny",
              email: "Email: wlaterkenny@gmail.com",
              position: "CEO Broloxx",
              numberOfProjects: "Number of projects: 2",
              viewProfile: "View Profile",
              viewProfileBtn: () {},
              editIconBtn: () {},
            ));
    return Expanded(
      child: Scaffold(
        key: _scaffoldkey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
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
                    child: DropDownMenu2(
                      onchange: (newValue) {
                        setState(() {
                          dropdown = newValue;
                          print(newValue);
                        });
                      },
                      dropdown: dropdown,
                      vale1: 'All Clients',
                      text1: 'All Clients',
                      vale2: 'Recently Added',
                      text2: 'Recently Added',
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SmallButton(
                    buttonHeight: 56,
                    onPressed: () {
                      showDialog(
                          context: context, builder: (builder) => ShowForm());
                    },
                    buttonWidth: 90,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: GlobalColors.whiteText,
                            size: 20,
                          ),
                          Text(
                            'New client',
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
              Divider(),
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                  child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.person_3,
                                  color: GlobalColors.iconDarkColor,
                                  size: 24,
                                  weight: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("All Clients",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ),
                          Divider(),
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
                                  border: Border.all(
                                      color: GlobalColors.dividerLine),
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
                                  border: Border.all(
                                      color: GlobalColors.dividerLine),
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
                      ),

                      //     Center(
                      //   child: Column(children: [
                      //     Padding(
                      //       padding: EdgeInsets.only(top: 15, bottom: 15),
                      //       child: ImageConainerWithAddProjectButton2(
                      //           ontap: () {
                      //             showDialog(
                      //                 context: context,
                      //                 builder: (builder) => ShowForm());
                      //           },
                      //           imageAsset: "assets/images/eempty box.png",
                      //           buttonTitle: 'Add client',
                      //           textTitle:
                      //               'Ouch! It looks like there are no clients available here yet'),
                      //     )
                      //   ]),
                      // ),
                      decoration: BoxDecoration(
                        border: Border.all(color: GlobalColors.dividerLine),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
                            bottom: Radius.circular(5)),
                      ),
                      width: 1091),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
