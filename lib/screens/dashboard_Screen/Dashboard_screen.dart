import 'package:codegraniteflutter/Local_storage/get_directory.dart';
import 'package:codegraniteflutter/services/Apis/GetInfoFromApi/getUserById.dart';
import 'package:codegraniteflutter/widgets/buttons/smallButton.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colorsConstrain/colorsHex.dart';
import '../../widgets/buttons/subTitleAndButton_widget.dart';
import '../../widgets/buttons/subtitleWithIconButtonLast_widget.dart';
import '../../widgets/containers/headerContainerTitel_widget.dart';
import '../../widgets/imageContainee/circlerImageContainer_widget.dart';
import '../../widgets/searchBoxWidget/saerchBox_widget.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
  var token;
  var id;
  String fullname = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decodeToken();
  }

  Future<void> decodeToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    print("see1: $token");

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
    setState(() {
      id = jwtDecodedToken['accountId'];
    });
    print("see1: $jwtDecodedToken");
    print(id);
    getClientInfByid();
  }

  Future<void> getClientInfByid() async {
    final getInfo = Provider.of<GetUserApiProvider>(context, listen: false);
    getInfo.getClientById(token, id).then((value) {
      setState(() {
        fullname = value.fullName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: GlobalColors.whiteText,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainerTitle(
                title: 'Welcome Back!, $fullname',
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
                    onPressed: () async {
                      String pixPath = await getPicturesPath();
                      print(pixPath);
                    },
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
                      backgroundcolor: Colors.white,
                      borderColor: GlobalColors.buttonBlue,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: GlobalColors.DarkBorder,
                              size: 20,
                            ),
                            Text(
                              'New user',
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
                        flex: 2.ceil(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SubTitleAndButton(
                              padding: const EdgeInsets.only(
                                  left: 30.0, top: 15, right: 30, bottom: 15),
                              title: 'Available Projects',
                              iconData: Icons.work_outline_rounded,
                              buttonTitle: 'Filter ',
                              buttonIcon: Icons.filter_alt_outlined,
                              ontap: () {},
                            ),
                            Divider(),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 600,
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        // itemExtent: 1200,
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: [
                                                DataTable(
                                                    columnSpacing: 138,
                                                    dataRowMaxHeight: 50,
                                                    columns: [
                                                      DataColumn(
                                                        label: Text(
                                                            "Project title",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                      ),
                                                      DataColumn(
                                                        label: Container(
                                                          width: 100,
                                                          child: Text(
                                                              "Project owner",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Status",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Users",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                      ),
                                                    ],
                                                    rows: [
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .pendingColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Pending",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .pendingColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Pending",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color:
                                                                    GlobalColors
                                                                        .errorRed,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Cancelled",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color:
                                                                    GlobalColors
                                                                        .errorRed,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Cancelled",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .pendingColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Pending",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .pendingColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Pending",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color:
                                                                    GlobalColors
                                                                        .errorRed,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Cancelled",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color:
                                                                    GlobalColors
                                                                        .errorRed,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Cancelled",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .pendingColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Pending",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .pendingColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Pending",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color:
                                                                    GlobalColors
                                                                        .errorRed,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Cancelled",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color: GlobalColors
                                                                    .successGreen,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Completed",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ]),
                                                      DataRow(cells: [
                                                        DataCell(Text(
                                                            "John doe project",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Text(
                                                            "Jane doe",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                        DataCell(Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 1),
                                                                color:
                                                                    GlobalColors
                                                                        .errorRed,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Text("Cancelled",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )),
                                                          ],
                                                        )),
                                                        DataCell(Container(
                                                          width: 100,
                                                          // height: 80,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7),
                                                          child:
                                                              Stack(children: [
                                                            Positioned(
                                                              left: 0,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person5.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person6.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person7.png',
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child:
                                                                  CirclerImageContainer(
                                                                width: 40,
                                                                height: 40,
                                                                circleZize: 90,
                                                                image:
                                                                    'assets/images/person8.png',
                                                              ),
                                                            ),
                                                          ]),
                                                        )),
                                                      ])
                                                    ])
                                              ],
                                            ),
                                          );
                                          // ImageConainerWithAddProjectButton(
                                          //   ontap: () {},
                                          //   imageAsset:
                                          //       'assets/images/frameProject.png',
                                          //   textTitle:
                                          //       "You have to projects yet!",
                                          //   buttonTitle: 'New project',
                                          // );
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
                        SubtitleWithIconButtonLast(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 15, right: 10, bottom: 15),
                          iconData: Icons.receipt_long,
                          title: 'Transactions',
                          buttonTitle: 'View all',
                          buttonIcon: Icons.arrow_forward_ios,
                          ontap: () {},
                        ),
                        Divider(),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 600,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    // itemExtent: 300,
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          children: [
                                            DataTable(
                                                // columnSpacing: 100,
                                                dataRowMaxHeight: 50,
                                                columns: [
                                                  DataColumn(
                                                    label: Container(
                                                      width: 50,
                                                      child: Text(
                                                        "Project title",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Container(
                                                      width: 50,
                                                      child: Text("Amount",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Container(
                                                      width: 60,
                                                      child: Text(
                                                          "Payment Type",
                                                          textAlign:
                                                              TextAlign.center,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Container(
                                                      width: 50,
                                                      child: Text("Date",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                                rows: [
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Initial",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Final",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Initial",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Final",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Initial",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Final",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Initial",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Final",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Final",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Initial",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Container(
                                                      width: 70,
                                                      child: Text(
                                                          "Dashboard Design",
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )),
                                                    )),
                                                    DataCell(Text("NGN 100,000",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("Final",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                    DataCell(Text("11/12/23",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ))),
                                                  ]),
                                                ]),
                                          ],
                                        ),
                                      );
                                      // ImageContainerWithText(
                                      //   width: 168,
                                      //   height: 136,
                                      //   imageAsset:
                                      //       'assets/images/frameProject3.png',
                                      //   text:
                                      //       "No transactions have been made yet!",
                                      //   padding:
                                      //       const EdgeInsets.only(
                                      //           left: 30.0,
                                      //           top: 10,
                                      //           right: 30,
                                      //           bottom: 15),
                                      // );
                                    }),
                              ),
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
      ),
    );
  }
}
