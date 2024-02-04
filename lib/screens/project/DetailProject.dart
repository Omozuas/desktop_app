import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/projectcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailProject extends StatelessWidget {
  const DetailProject({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectController());
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      controller.selectedIndex.value = 0;
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text("Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              child: Row(
                children: [
                  Flexible(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: GlobalColors.dividerLine),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5),
                                bottom: Radius.circular(5)),
                          ),
                          width: 1100)),
                  Flexible(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: GlobalColors.dividerLine),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5),
                                bottom: Radius.circular(5)),
                          ),
                          width: 1100))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
