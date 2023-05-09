import 'package:flutter/material.dart';

import '../Services/Others/Width&Height.dart';
import 'defaultDropDownButton.dart';

class SettingsButton extends StatelessWidget {
  SettingsButton(
    this.label,
    this.suffix, {
    super.key,
  });
  Widget suffix;
  String label;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: heightScr(context) * 0.055,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            suffix,
          ],
        ),
      ),
    );
  }
}
