import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Widgets/showALertDialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

uploadProject(File file, String title, Timestamp expDate, int goal,
    String location, String overview, BuildContext context) async {
  final fire = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  String downloadUrl = '';
  final ref = store
      .ref()
      .child('Project_Pics/')
      .child('${generateRandomString(35)}.jpg');
  UploadTask upTask = ref.putData(await file.readAsBytes());
  final projectsID = await fire
      .collection('Projects')
      .orderBy('ProjectID')
      .limitToLast(1)
      .get()
      .then((QuerySnapshot snap) =>
          snap.docs.map((DocumentSnapshot e) => e.get('ProjectID')));
  int pID = projectsID.elementAt(0) + 1;
  upTask.whenComplete(() async {
    downloadUrl = await ref.getDownloadURL();
    final docID = await fire.collection('Projects').doc().id;
    await fire.collection('Projects').doc(docID).set({
      "title": title,
      "overview": overview,
      "expireDate": expDate,
      "Goal": goal,
      "Location": location,
      "uid": getUid(),
      "currentPoints": 0,
      "ProjectID": pID,
      "projectIMG": downloadUrl,
      "docID": docID
    });
    await fire.collection('Users').doc(getUid()).update({
      "yourProject": FieldValue.arrayUnion([pID])
    });
    Provider.of<dataprovider>(context, listen: false).addYourProjects(pID);
    showAlertDialog(context, 'Project Added Successfully!');
  });
}

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
