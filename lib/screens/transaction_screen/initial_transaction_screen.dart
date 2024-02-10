import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/screens/transaction_screen/transaction_details_builder.dart';
import 'package:codegraniteflutter/screens/transaction_screen/widget/payment_description_header.dart';
import 'package:flutter/material.dart';

class InitialTransactionWidget extends StatelessWidget {
  const InitialTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int num = 1;
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Container(
              // width: 1170, for all transaction
              width: 1471,
              height: 782,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: GlobalColors.lightBorder),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22, left: 48),
                    child: SizedBox(
                      width: 190,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                                maxWidth: 24.0, maxHeight: 24.0),
                            child: Image.asset(
                              'assets/images/Property 1=outline (1).png',
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                                maxWidth: 150, maxHeight: 30),
                            child: const Text(
                              'Initial Transactions',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //const NoTransaction()

                  const FieldDescription(),
                  Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              TransactionDetailsBuilder(
                                text1: '${num++}',
                                text2: 'Dashboard Design',
                                text3: 'NGN 100',
                                text4: 'Initial',
                                text5: '11th Jan 2023',
                                color1: GlobalColors.foundationblack100,
                                color2: GlobalColors.foundationblack500,

                                // padding: EdgeInsets.all(4),
                              ),
                              const Divider()
                            ],
                          );
                        }),
                  ),
                ],
              )))
    ]);
  }
}
