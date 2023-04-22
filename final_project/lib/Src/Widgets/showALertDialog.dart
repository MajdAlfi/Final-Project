import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:flutter/material.dart';

showAlertDialog(context, String alertTxt) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            title: const Icon(Icons.warning),
            content: Text(alertTxt),
            actions: [
              Center(
                child: Container(
                    height: heightScr(context) * 0.045,
                    width: widthScr(context) * 0.28,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: mainColor()),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Ok',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              )
            ],
          ));
}
