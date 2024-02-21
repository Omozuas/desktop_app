import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/projectcontroller.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../progressBar/progressBar1.dart';

class ProjectPage extends StatelessWidget {
  ProjectPage({
    super.key,
    required this.index,
  });
  int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectController());
    List<double> percentage = [40, 157, 151, 157, 152, 13];
    String delail = '';

    // if (percentage <= 52) {
    //   delail = "Pending";
    // } else if (percentage[0] <= 156) {
    //   delail = "In Progress";
    // } else if (percentage[0] <= 157) {
    //   delail = "Completed";
    // } else {
    //   // Default to green if progress exceeds 157%
    // }
    return Column(
      children: [
        Text('Page number : ${index + 1}'),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 290,
              crossAxisSpacing: 7,
            ),
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: percentage.length,
            itemBuilder: (context, index1) {
              if (percentage[index1] <= 52) {
                delail = "Pending";
              } else if (percentage[index1] <= 156) {
                delail = "In Progress";
              } else if (percentage[index1] <= 157) {
                delail = "Completed";
              } else {
                // Default to green if progress exceeds 157%
              }
              return Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15.0, bottom: 10),
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15.0, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/folder-2.png'),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text('Project Status:',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Flexible(
                                child: Text('Emergency Response App',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Project Status:',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(
                                width: 3,
                              ),
                              Flexible(
                                child: CustomProgressBar(
                                  height: 8,
                                  width: 157,
                                  progress: percentage[index1],
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('(${delail})',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text('Project Manager:',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(
                                width: 3,
                              ),
                              Flexible(
                                child: Text('Karl Mbemba',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    print('object');
                                  },
                                  child: Text('(View Profile)',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalColors.buttonBlue,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Text('Project end date:',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(' 12/04/2024',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TransparentButton(
                              buttonWidth: 108,
                              onPressed: () {
                                controller.selectedIndex.value = 1;
                              },
                              buttonHeight: 32,
                              backgroundcolor: Colors.white,
                              borderColor: GlobalColors.deepBlue,
                              child: Text('view Project',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: GlobalColors.deepBlue,
                                    fontWeight: FontWeight.w500,
                                  )))
                        ],
                      ),
                    ),
                    width: 454,
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColors.dividerLine),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5), bottom: Radius.circular(5)),
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}
