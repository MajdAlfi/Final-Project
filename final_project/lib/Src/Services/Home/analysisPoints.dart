import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/pointsModel.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future analysisPoints(context) async {
  final fire = FirebaseFirestore.instance;
  List<pointsModel> listPoints = [];

  final data =
      await fire.collection('Points').where('uid', isEqualTo: getUid()).get();
  for (int i = 0; i < data.docs.length; i++) {
    final date = data.docs[i]['Date'].toDate();
    final dateOnly = DateUtils.dateOnly(date);
    if (listPoints.where((element) => element.gainedOn == dateOnly).isEmpty) {
      listPoints
          .add(pointsModel(points: data.docs[i]['Point'], gainedOn: dateOnly));
    } else {
      listPoints
          .where((element) => element.gainedOn == dateOnly)
          .first
          .points += int.parse(data.docs[i]['Point'].toString());
    }
  }
  listPoints.sort(
    (a, b) => b.gainedOn.compareTo(a.gainedOn),
  );
  // print(listPoints.first.gainedOn);
  Provider.of<dataprovider>(context, listen: false)
      .changeListPoints(listPoints);
}
