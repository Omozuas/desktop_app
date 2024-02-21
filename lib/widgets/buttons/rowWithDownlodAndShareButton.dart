import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWithDownloadAndShareButton extends StatelessWidget {
  RowWithDownloadAndShareButton(
      {super.key,
      required this.nameofproject,
      required this.share,
      required this.sharebutton,
      required this.download,
      required this.downloadbutton});
  String nameofproject, share, download;
  VoidCallback sharebutton, downloadbutton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/document.png'),
            SizedBox(
              width: 5,
            ),
            Text(nameofproject,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: sharebutton,
                    child: Image.asset('assets/images/share.png')),
                SizedBox(
                  width: 5,
                ),
                Text(share,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: downloadbutton,
                    child: Image.asset('assets/images/document-download.png')),
                SizedBox(
                  width: 5,
                ),
                Text(download,
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.dividerLine,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
