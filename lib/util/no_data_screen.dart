import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'res_dimens.dart';


class NoDataScreen extends StatelessWidget {
  String? title;
  String? image;

  NoDataScreen({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Image.asset(image??"",width: 120,height: 120,)),
            Text(title ?? 'Data Not Available',
              style: TextStyle(
                   fontSize: dimen16,

              ),
            ),

          ],
        ),
      ),
    );
  }

}