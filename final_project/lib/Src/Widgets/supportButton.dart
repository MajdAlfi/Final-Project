import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Projects/checkSupported.dart';
import 'package:final_project/Src/Widgets/askSupportAlert.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class supportButton extends StatefulWidget {
  supportButton({super.key, required this.projectID});
  int projectID;
  @override
  State<supportButton> createState() => _supportButtonState();
}

class _supportButtonState extends State<supportButton> {
  @override
  Widget build(BuildContext context) {
    print('setSate');
    return (checkSupported(context, widget.projectID))
        ? Container(
            height: heightScr(context) * 0.05,
            width: widthScr(context) * 0.9,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: greyColor()),
            child: const Center(
              child: Text(
                'Supported Already!',
                style: TextStyle(
                    color: Color.fromARGB(197, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        : defaultElevatedButton(context, "Support Project", () async {
            await askSupportAlert(context, widget.projectID)
                .then((value) async {
              setState(() {});
            });
          });
  }
}
