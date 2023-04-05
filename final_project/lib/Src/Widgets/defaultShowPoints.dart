import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/Width&Height.dart';

Container defaultShowPoints(BuildContext context, int point, String label) {
  return Container(
    width: widthScr(context) * 0.3,
    height: 60,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color.fromRGBO(0, 0, 0, 0.05),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$point",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                "$label",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    ),
  );
}