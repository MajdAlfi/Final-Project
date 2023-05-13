import 'package:flutter/material.dart';

import '../Services/Others/Width&Height.dart';
import '../Services/Others/mainColor.dart';

Future laodingDialog(context) {
  return showDialog(
      context: context,
      builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                content: SizedBox(
                    height: heightScr(context) * 0.1,
                    width: widthScr(context) * 0.8,
                    child: Center(child: CircularProgressIndicator()))),
          ));
}
