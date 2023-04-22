import 'package:flutter/material.dart';

import '../Services/Others/Width&Height.dart';
import '../Services/Others/mainColor.dart';

Future askLoginDialog(context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            title: Icon(Icons.warning),
            content: const Text(
                'Your currently not logged in do you want to login to store your progress?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  height: heightScr(context) * 0.045,
                  width: widthScr(context) * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: mainColor()),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/loginScr');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ))
            ],
          ));
}
