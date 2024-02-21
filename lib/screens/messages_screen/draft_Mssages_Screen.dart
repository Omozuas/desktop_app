import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/responsive/responsive.dart';
import 'package:codegraniteflutter/widgets/searchBoxWidget/saerchBox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftMessagesScreen extends StatelessWidget {
  const DraftMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    TextEditingController searchController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 170,
                  child: TransparentButton(
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
                              'New message',
                              style: TextStyle(
                                  color: GlobalColors.DarkBorder,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ])),
                ),
                EmptyContainer(
                  width: 473,
                  height: 50,
                  boderColor: GlobalColors.lightBorder,
                  child: SearchBox(
                    text: 'Search...',
                    controller: searchController,
                    iconData: CupertinoIcons.search,
                    iconSize: 20,
                    keys: formKey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columnSpacing: Responsive.isDesktop(context) ? 100 : 30,
                  border: TableBorder.all(
                      width: 1,
                      color: GlobalColors.lightBorder,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  dataRowMaxHeight: 50,
                  horizontalMargin: 10,
                  columns: [
                    DataColumn(
                        label: Flexible(
                      child: Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("S/N",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )),
                    DataColumn(
                      label: Flexible(
                        child: Container(
                          width: 60,
                          child: Center(
                            child: Text("Message",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Flexible(
                        child: Container(
                          width: 60,
                          child: Text("Stack",
                              textAlign: TextAlign.start,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Flexible(
                        child: Container(
                          width: 50,
                          child: Text("date",
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Flexible(
                        child: Container(
                          width: 50,
                          child: Text("Time",
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Flexible(
                        flex: 3,
                        child: Container(
                          width: 50,
                          child: Text("Status",
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("1",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                      DataCell(Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Boss Doe",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("this is the message content",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      )),
                      DataCell(Container(
                        width: 120,
                        child: Text("Designer",
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 105,
                        child: Text("11th, Nov. 2023",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 75,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Center(
                            child: Text("12:00 pm",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: GlobalColors.lightBorder,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                      DataCell(Container(
                        width: 70,
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 28,
                            child: Center(
                              child: Text("Draft",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: GlobalColors.butterColoryellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("2",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                      DataCell(Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Boss Doe",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("this is the message content",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      )),
                      DataCell(Container(
                        width: 120,
                        child: Text("Designer",
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 105,
                        child: Text("11th, Nov. 2023",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 75,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Center(
                            child: Text("12:00 pm",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: GlobalColors.lightBorder,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                      DataCell(Container(
                        width: 70,
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 28,
                            child: Center(
                              child: Text("Draft",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: GlobalColors.butterColoryellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("3",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                      DataCell(Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Boss Doe",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("this is the message content",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      )),
                      DataCell(Container(
                        width: 120,
                        child: Text("Designer",
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 105,
                        child: Text("11th, Nov. 2023",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 75,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Center(
                            child: Text("12:00 pm",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: GlobalColors.lightBorder,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                      DataCell(Container(
                        width: 70,
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 28,
                            child: Center(
                              child: Text("Draft",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: GlobalColors.butterColoryellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("4",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                      DataCell(Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Boss Doe",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("this is the message content",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      )),
                      DataCell(Container(
                        width: 120,
                        child: Text("Designer",
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 105,
                        child: Text("11th, Nov. 2023",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 75,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Center(
                            child: Text("12:00 pm",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: GlobalColors.lightBorder,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                      DataCell(Container(
                        width: 70,
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 28,
                            child: Center(
                              child: Text("Draft",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: GlobalColors.butterColoryellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("5",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                      DataCell(Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Boss Doe",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("this is the message content",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      )),
                      DataCell(Container(
                        width: 120,
                        child: Text("Designer",
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 105,
                        child: Text("11th, Nov. 2023",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 75,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Center(
                            child: Text("12:00 pm",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: GlobalColors.lightBorder,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                      DataCell(Container(
                        width: 70,
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 28,
                            child: Center(
                              child: Text("Draft",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: GlobalColors.butterColoryellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                        width: 40,
                        child: Container(
                          width: 50,
                          height: 60,
                          child: Center(
                            child: Text("6",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                            color: GlobalColors.lightBorder,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                      DataCell(Container(
                        width: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Boss Doe",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("this is the message content",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      )),
                      DataCell(Container(
                        width: 120,
                        child: Text("Designer",
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 105,
                        child: Text("11th, Nov. 2023",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                      DataCell(Container(
                        width: 75,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Center(
                            child: Text("12:00 pm",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          decoration: BoxDecoration(
                              color: GlobalColors.lightBorder,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
                      DataCell(Container(
                        width: 70,
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 28,
                            child: Center(
                              child: Text("Draft",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: GlobalColors.butterColoryellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      )),
                    ]),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
