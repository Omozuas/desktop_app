import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteDialog extends StatelessWidget {
  const InviteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 185, top: 22),
                child: SizedBox(
                    width: 311,
                    height: 40,
                    child: Text('Invite Client to Workspace',
                        style: TextStyle(
                            color: GlobalColors.foundationblack500,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                        textAlign: TextAlign.center)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150, top: 10, right: 20),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                    print('Button tapped');
                  },
                  child: const SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(Icons.cancel_outlined),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 91, top: 35),
            child: SizedBox(
              width: 500,
              height: 223.39,
              child: Image.asset('assets/images/Invite_Background.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 51, top: 50),
            child: SizedBox(
              width: 580,
              height: 218,
              child: SizedBox(
                width: 580,
                height: 107,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 580,
                      height: 22,
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: GlobalColors.DarkBorder),
                      ),
                    ),
                    Container(
                      width: 580,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: GlobalColors.lightBorder),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'e.g John Doe',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: GlobalColors.greyText)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 580,
                      height: 22,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: GlobalColors.DarkBorder),
                      ),
                    ),
                    Container(
                      width: 580,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: GlobalColors.lightBorder),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'admin@techltd.com',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: GlobalColors.greyText)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.back();
                print('Button tapped');
              },
              child: Container(
                height: 56,
                width: 180,
                decoration: BoxDecoration(
                    color: GlobalColors.buttonBlue,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8), bottom: Radius.circular(8))),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: GlobalColors.whiteText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
