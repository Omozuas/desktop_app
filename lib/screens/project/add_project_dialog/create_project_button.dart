import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

class CreateProjectButton extends StatelessWidget {
  const CreateProjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print('Project saved');
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        width: 180,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8), bottom: Radius.circular(8)),
            color: GlobalColors.buttonBlue),
        child: Text(
          'Create Project',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: GlobalColors.whiteText),
        ),
      ),
    );
  }
}
