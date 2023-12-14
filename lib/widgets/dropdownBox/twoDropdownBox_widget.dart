import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class DropDownMenu2 extends StatelessWidget {
  DropDownMenu2(
      {super.key,
      required this.onchange,
      required this.vale1,
      required this.text1,
      required this.vale2,
      required this.text2,
      this.dropdown});

  final onchange;
  final dropdown;
  String vale1, text1, vale2, text2;
  // VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.only(left: 6, right: 16),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(10),
        value: dropdown,
        icon: Icon(Icons.arrow_drop_down_outlined),
        iconSize: 36,
        isExpanded: true,
        focusColor: GlobalColors.whiteText,
        dropdownColor: Colors.white,
        onChanged: onchange,
        items: [
          DropdownMenuItem<String>(
              value: vale1,
              child: Text(text1,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))),
          DropdownMenuItem<String>(
              value: vale2,
              child: Text(text2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))),
        ],
      ),
    );
  }
}
