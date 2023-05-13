import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/actionButtonListType.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class groupActionButton extends StatelessWidget {
  groupActionButton({super.key, required this.actionBtn, required this.index});
  actionButtonListType actionBtn;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (actionBtn.isSeleccted == true) {
          Provider.of<dataprovider>(context, listen: false)
              .changeIsSelectedGroupBtn(false, index);
        } else {
          dynamic testDate = FirebaseFirestore.instance
              .collection("Users")
              .doc(getUid())
              .collection("Actions")
              .doc(actionBtn.index.toString())
              .get()
              .then((value) {
            Timestamp timestamp =
                value.exists ? value.get("date") : Timestamp(0, 0);

            if (!value.exists) {
              Provider.of<dataprovider>(context, listen: false)
                  .changeIsSelectedGroupBtn(true, index);
            } else if ((DateTime.now().millisecondsSinceEpoch -
                    timestamp.millisecondsSinceEpoch) >
                86400000) {
              print(true);

              Provider.of<dataprovider>(context, listen: false)
                  .changeIsSelectedGroupBtn(true, index);
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Action Already Done"),
                  content: Text("You have already done this action today."),
                  actions: [
                    defaultElevatedButton(context, "OK", () {
                      Navigator.pop(context);
                    })
                  ],
                ),
              );
            }
          });
        }
      },
      child: Container(
        height: heightScr(context) * 0.07,
        width: widthScr(context) * 0.9,
        decoration: BoxDecoration(
            color: (actionBtn.isSeleccted == true) ? mainColor() : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                actionBtn.iconBtn,
                size: 30,
                color: (actionBtn.isSeleccted == true)
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
            SizedBox(
              width: widthScr(context) * 0.55,
              child: Text(actionBtn.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: (actionBtn.isSeleccted == true)
                          ? Colors.white
                          : Colors.black87,
                      fontSize: (actionBtn.name.length > 30) ? 15 : 17)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text('${actionBtn.pts} Pts',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: (actionBtn.isSeleccted == true)
                          ? Colors.white
                          : mainColor(),
                      fontSize: 17)),
            )
          ],
        ),
      ),
    );
  }
}
