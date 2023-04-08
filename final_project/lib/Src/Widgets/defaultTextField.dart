import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:flutter/material.dart';

import '../Services/greyColor.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  IconData icon;
  bool? secure;
  IconData? sufIcon;
  VoidCallback? onSufIconTap;
  DefaultTextField(this.label, this.icon,
      {super.key, this.secure, this.sufIcon, this.onSufIconTap});

  Widget build(BuildContext context) {
    return SizedBox(
      height: heightScr(context) * 0.065,
      width: widthScr(context) * 0.85,
      child: TextFormField(
        obscureText: secure ?? false,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: onSufIconTap,
              icon: Icon(sufIcon),
            ),
            label: Text(label),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: greyColor(),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
