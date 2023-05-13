import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/userModel.dart';
import 'package:final_project/Src/Screens/firstUI.dart';
import 'package:final_project/Src/Screens/homeScr.dart';
import 'package:final_project/Src/Screens/loginScr.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Projects/uploadProject.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> register(String email, String password, String name, File file,
    BuildContext context) async {
  final fire = FirebaseFirestore.instance;
  final oldUser = Provider.of<dataprovider>(context, listen: false).userData;
  final store = FirebaseStorage.instance;

  final docIDs = await fire
      .collection('Points')
      .where('uid', isEqualTo: getUid())
      .get()
      .then((QuerySnapshot snap) => snap.docs.map((DocumentSnapshot docSnap) {
            if (docSnap.exists) {
              return docSnap.get('docID');
            }
          }));

  await fire.collection("Users").doc(getUid()).delete();
  if (file.path.isNotEmpty) {
    final ref = store.ref().child('profile_pics/');
    UploadTask upTask = ref.putData(await file.readAsBytes());

    print(getUid());
    await auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) async => upTask
                .whenComplete(() async => FirebaseFirestore.instance
                        .collection("Users")
                        .doc(value.user!.uid)
                        .set({
                      "name": name,
                      "points": oldUser!.points,
                      "ActionsCompleted": oldUser.actionsCompleted,
                      "description": "description",
                      "goal": oldUser.goal,
                      "yourProject": oldUser.yourProject,
                      "supportedProject": oldUser.supportedProjects,
                      "profileIMG": await ref.getDownloadURL()
                    }))
                .catchError((e) {
              Fluttertoast.showToast(
                  msg: "Incorrect email or password. Please try again.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[600],
                  textColor: Colors.white,
                  fontSize: 16.0);
            }).then((_) {
              for (int i = 0; i < docIDs.length; i++) {
                fire
                    .collection('Points')
                    .doc(docIDs.elementAt(i))
                    .update({"uid": getUid()});
              }
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return firstUI();
              }));
            }));
  } else {
    const ref =
        'https://firebasestorage.googleapis.com/v0/b/final-project-d9c7c.appspot.com/o/Project_Pics%2FdefaultProfileImage.jpg?alt=media&token=44c944da-fe0d-4242-b718-0cf56d3070c7';
    await auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) async => FirebaseFirestore.instance
                .collection("Users")
                .doc(value.user!.uid)
                .set({
              "name": name,
              "points": oldUser!.points,
              "ActionsCompleted": oldUser.actionsCompleted,
              "description": "description",
              "goal": oldUser.goal,
              "yourProject": oldUser.yourProject,
              "supportedProject": oldUser.supportedProjects,
              "profileIMG": ref
            }))
        .catchError((e) {
      Fluttertoast.showToast(
          msg: "Incorrect email or password. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0);
    }).then((_) {
      for (int i = 0; i < docIDs.length; i++) {
        fire
            .collection('Points')
            .doc(docIDs.elementAt(i))
            .update({"uid": getUid()});
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return firstUI();
      }));
    });
  }
}

void signIn(String email, String password, BuildContext context) {
  auth
      .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
      .then((value) => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return firstUI();
          })))
      .catchError((e) {
    Fluttertoast.showToast(
        msg: "Incorrect email or password. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 16.0);
  });
}

Future anonymous() async {
  await auth.signInAnonymously().then((value) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(value.user!.uid)
        .set({
      "name": "Anonymous",
      "points": 0,
      "ActionsCompleted": 0,
      "description": "description",
      "goal": 100,
      "yourProject": [].toList(),
      "supportedProject": [].toList(),
      "profileIMG": ""
    });
  });
}

Future anonymousSaveData(context) async {
  final userData =
      await FirebaseFirestore.instance.collection("Users").doc(getUid()).get();
  print('uerrr:${userData.data()}');
  final user = userModel(
      name: userData['name'],
      actionsCompleted: userData['ActionsCompleted'],
      points: userData['points'],
      desc: userData['description'],
      goal: userData['goal'],
      supportedProjects: userData['supportedProject'],
      yourProject: userData['yourProject'],
      profileIMG: userData['profileIMG']);
  Provider.of<dataprovider>(context, listen: false).changeUserData(user);
}
