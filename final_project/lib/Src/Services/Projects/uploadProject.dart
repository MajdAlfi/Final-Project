import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:firebase_storage/firebase_storage.dart';

uploadProject(File file, String title, Timestamp expDate, int goal,
    String location, String overview) async {
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
      .orderBy('projectID', descending: true)
      .limit(1)
      .get()
      .then((QuerySnapshot snap) =>
          snap.docs.map((DocumentSnapshot e) => e.get('projectID')));
  int pID = projectsID.elementAt(0) + 1;
  upTask.whenComplete(() async {
    downloadUrl = await ref.getDownloadURL();
    fire.collection('Projects').doc().set({
      "title": title,
      "overview": overview,
      "expireDate": expDate,
      "Goal": goal,
      "Location": location,
      "uid": getUid(),
      "currentPoints": 0,
      "ProjectID": pID,
      "projectIMG": downloadUrl
    });
  });
}

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
