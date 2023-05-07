import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/Others/Width&Height.dart';
import '../Services/Others/mainColor.dart';

Future askLoginDialog(context, String ask) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            title: Icon(Icons.warning),
            content: Text(
              '$ask',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    Provider.of<languages>(context).tSkip(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  height: heightScr(context) * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: mainColor()),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/loginScr');
                    },
                    child: Text(
                      Provider.of<languages>(context).tLogin(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ))
            ],
          ));
}
