import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:codegraniteflutter/widgets/dropdownBox/twoDropdownBox_widget.dart';
import 'package:codegraniteflutter/widgets/searchBoxWidget/saerchBox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String dropdown = 'All Transaction';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        key: _scaffoldkey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderContainerTitle(title: 'Transaction'),
            Divider(),
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
                  width: 200,
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
                  width: 5,
                ),
                Flexible(
                  child: DropDownMenu4(
                    onchange: (newValue) {
                      setState(() {
                        dropdown = newValue;
                        print(newValue);
                      });
                    },
                    dropdown: dropdown,
                    vale1: 'All Transaction',
                    text1: 'All Transaction',
                    vale2: 'Initial Transaction',
                    text2: 'Initial Transaction',
                    vale3: 'Final Transaction',
                    text3: 'Final Transaction',
                  ),
                ),
              ]),
            ),
            Divider(),
            ////start from here
          ],
        ),
      ),
    );
  }
}
