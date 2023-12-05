import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/widgets/imageContainee/circlerImageContainer_widget.dart';
import 'package:flutter/material.dart';

class NavMenueProfile extends StatelessWidget {
  NavMenueProfile(
      {super.key,
      required this.onTap,
      required this.email,
      required this.name,
      required this.image});
  VoidCallback onTap;
  String image;
  String name;
  String email;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(children: [
          GestureDetector(
            onTap: onTap,
            child: CirclerImageContainer(
              image: image,
              width: 50,
              circleZize: 54,
              height: 50,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                color: GlobalColors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ]),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            Text(email,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ))
          ],
        )
      ],
    );
  }
}
