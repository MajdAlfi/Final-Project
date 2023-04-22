import 'package:final_project/Src/Models/actionButtonListType.dart';
import 'package:final_project/Src/Screens/firstUI.dart';
import 'package:final_project/Src/Widgets/actionBottomSheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';

class dataprovider extends ChangeNotifier {
  List<actionButtonListType> btnList = [
    actionButtonListType(
        index: 0,
        name: 'Reduce Paper Wastage',
        iconBtn: Icons.cut,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 1,
        name: 'Avoid Using Disposable Water Bottles and Cups',
        iconBtn: Icons.stop_circle,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 2,
        name: 'Turn off Lights',
        iconBtn: Icons.lightbulb_outlined,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 3,
        name: 'Use Energy-Saving Lightbulbs',
        iconBtn: Icons.electrical_services,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 4,
        name: 'Keep a Compost Bin',
        iconBtn: Icons.delete,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 5,
        name: 'Carpool',
        iconBtn: Icons.drive_eta,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 6,
        name: 'Swap Baths for Showers',
        iconBtn: Icons.shower,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 7,
        name: 'Shop with Re-Usable Shopping Bags',
        iconBtn: Icons.shopping_bag,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 8,
        name: 'Use Cloth Napkins Instead of Paper Ones',
        iconBtn: Icons.receipt,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 9,
        name: 'Repurpose and Recycle',
        iconBtn: Icons.recycling,
        pts: 10,
        isSeleccted: false),
  ];
  changeIsSelectedGroupBtn(bool isSelected, int index) {
    btnList.elementAt(index).isSeleccted = isSelected;
    notifyListeners();
  }

  signOut(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut().then((value) {
      anonymous().then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => firstUI(),
          )));
    });

    notifyListeners();
  }
}
