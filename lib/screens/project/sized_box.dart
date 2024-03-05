import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double h1,  h3;
  
  final String t1, t2;
  
  const Box({
    super.key,
    required this.h1,
    required this.t1,
    required this.h3,
    required this.t2,
    
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 580,
      height: h1,
      child: Column(
        children: [
          SizedBox(
            width: 580,
            height: 22,
            child: Text(
              t1,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: GlobalColors.DarkBorder,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: GlobalColors.lightBorder)),
            width: 580,
            height: h3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: t2,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: GlobalColors.greyText))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
