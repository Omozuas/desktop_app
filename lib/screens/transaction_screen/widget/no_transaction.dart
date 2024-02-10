import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class NoTransaction extends StatelessWidget {
  const NoTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Container(
              width: 1170,
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
                                'All Transactions',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 791,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: GlobalColors.lightBorder)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 374),
                      child: SizedBox(
                          width: 421,
                          height: 386,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                    'assets/images/transaction_background.png'),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                  width: 329,
                                  height: 36,
                                  child: Text(
                                    'No transactions have been made yet!',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          )),
                    )
                  ])))
    ]);
  }
}
