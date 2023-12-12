import 'package:codegraniteflutter/widgets/containers/containrs_widegt.dart';
import 'package:flutter/material.dart';

import '../../colorsConstrain/colorsHex.dart';

class DetailAccountWorkInfo extends StatefulWidget {
  DetailAccountWorkInfo({
    super.key,
  });

  @override
  State<DetailAccountWorkInfo> createState() => _DetailAccountWorkInfoState();
}

class _DetailAccountWorkInfoState extends State<DetailAccountWorkInfo> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: GlobalColors.whiteText,
      child: Container(
        width: 406,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalColors.whiteText),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28.0, left: 28, right: 28, bottom: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("John doe project",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: GlobalColors.DarkBorder,
                        fontWeight: FontWeight.w600,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              EmptyContainer(
                  child: Column(
                    children: [],
                  ),
                  boderColor: GlobalColors.dividerLine,
                  height: 40,
                  width: 40)
            ],
          ),
        ),
      ),
    );
  }
}
