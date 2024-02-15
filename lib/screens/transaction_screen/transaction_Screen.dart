import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/transaction_screen/all_transaction_widget.dart';
import 'package:codegraniteflutter/screens/transaction_screen/final_transaction_widget.dart';
import 'package:codegraniteflutter/screens/transaction_screen/initial_transaction_widget.dart';
import 'package:codegraniteflutter/screens/transaction_screen/widget/payment_description_header.dart';
import 'package:codegraniteflutter/screens/transaction_screen/widget/no_transaction.dart';
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainerTitle(title: 'Transaction'),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: Row(children: [
                  Expanded(
                    flex: 1,
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
                  const SizedBox(
                    width: 200,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      constraints:
                          const BoxConstraints(maxHeight: 20.0, maxWidth: 20.0),
                      child: Icon(
                        Icons.filter_list,
                        color: GlobalColors.DarkBorder,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      constraints:
                          const BoxConstraints(maxHeight: 20.0, maxWidth: 53.6),
                      child: Text(
                        'Filter by',
                        style: TextStyle(
                            color: GlobalColors.DarkBorder,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                  const SizedBox(
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

              ////start from here
              ///

              const Center(child: AllTransactionWidget())
              // const FinalTransactionWidget()
            ],
          ),
        ),
      ),
      // ],
      //),
      //),
      //),
    );
  }
}
