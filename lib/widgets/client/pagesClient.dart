import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/NavTabMenue/clienController.dart';
import 'package:codegraniteflutter/widgets/buttons/transparentButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagesClient extends StatelessWidget {
  PagesClient(
      {super.key,
      required this.index,
      required this.image,
      required this.name,
      required this.email,
      required this.image2,
      required this.position,
      required this.numberOfProjects,
      required this.viewProfile,
      required this.viewProfileBtn,
      required this.editIconBtn});
  int index;
  List image;
  List image2;
  String name, position, email, numberOfProjects, viewProfile;
  VoidCallback editIconBtn, viewProfileBtn;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClientController());
    return Column(
      children: [
        Text('Page number : ${index + 1}'),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 257,
              crossAxisSpacing: 7,
            ),
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: image.length,
            itemBuilder: (context, index1) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15.0, bottom: 15),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          index + 1 == 1
                                              ? image[index1]
                                              : image2[index1],
                                        ),
                                        fit: BoxFit.cover),
                                    border: Border.all(
                                        color: GlobalColors.dividerLine),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(5),
                                        bottom: Radius.circular(5)),
                                  ),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(position,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(email,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit))
                                  ],
                                ),
                                Text(numberOfProjects,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TransparentButton(
                                  buttonHeight: 32,
                                  onPressed: () async {
                                    // final _preferences =
                                    //     await SharedPreferences.getInstance();
                                    // _preferences.setString('clientId', 'id');
                                    controller.selectedIndex.value = 1;
                                  },
                                  backgroundcolor: GlobalColors.whiteText,
                                  borderColor: GlobalColors.buttonBlue,
                                  buttonWidth: 120,
                                  child: Text(viewProfile,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  width: 454,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: GlobalColors.dividerLine),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5), bottom: Radius.circular(5)),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
