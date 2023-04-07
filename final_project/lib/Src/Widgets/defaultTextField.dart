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
    return TextFormField(
      obscureText: secure ?? false,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onSufIconTap,
            icon: Icon(sufIcon),
          ),
          hintText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: greyColor(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
