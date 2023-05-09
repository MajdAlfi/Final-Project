import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:flutter/material.dart';

import '../Services/Others/greyColor.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  IconData icon;
  bool? secure;
  IconData? sufIcon;
  VoidCallback? onSufIconTap;
  TextEditingController? textController;
  DefaultTextField(this.label, this.icon,
      {super.key,
      this.secure,
      this.sufIcon,
      this.onSufIconTap,
      this.textController});

  Widget build(BuildContext context) {
    return SizedBox(
      height: (label == 'Overview')
          ? heightScr(context) * 0.1
          : heightScr(context) * 0.065,
      width: widthScr(context) * 0.85,
      child: TextFormField(
        maxLines: (label == 'Overview') ? 5 : 1,
        controller: textController,
        obscureText: secure ?? false,
        keyboardType: (label == 'Goal' || label == "Set Goal")
            ? TextInputType.number
            : TextInputType.text,
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
