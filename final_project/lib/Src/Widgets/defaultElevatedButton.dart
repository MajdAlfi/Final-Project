import 'package:final_project/Src/Services/mainColor.dart';
import 'package:flutter/material.dart';

ElevatedButton defaultElevatedButton(
    BuildContext context, String label, dynamic onTap) {
  return ElevatedButton(
    onPressed: onTap,
    child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.04,
        child: Center(
            child: Text(
          "$label",
          style: TextStyle(fontSize: 16),
        ))),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: mainColor(),
    ),
  );
}
