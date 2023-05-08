import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:flutter/material.dart';

ElevatedButton defaultElevatedButton(
    BuildContext context, String label, dynamic onTap,
    {IconData? icon, Color? bgColor}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: bgColor ?? mainColor(),
    ),
    child: SizedBox(
        width: double.infinity,
        height: heightScr(context) * 0.055,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15),
            ),
            Visibility(
              visible: icon != null,
              child: SizedBox(
                width: 5,
              ),
            ),
            Visibility(visible: icon != null, child: Icon(icon))
          ],
        ))),
  );
}
