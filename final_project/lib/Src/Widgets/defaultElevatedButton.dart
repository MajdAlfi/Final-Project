import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/mainColor.dart';
import 'package:flutter/material.dart';

ElevatedButton defaultElevatedButton(
    BuildContext context, String label, dynamic onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: mainColor(),
    ),
    child: SizedBox(
        width: double.infinity,
        height: heightScr(context) * 0.04,
        child: Center(
            child: Text(
          label,
          style: const TextStyle(fontSize: 15),
        ))),
  );
}
