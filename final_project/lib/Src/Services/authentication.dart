import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Screens/firstUI.dart';
import 'package:final_project/Src/Screens/homeScr.dart';
import 'package:final_project/Src/Screens/loginScr.dart';
import 'package:final_project/Src/Services/dataprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void register(
    String email, String password, String name, BuildContext context) {
  auth
      .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
      .then((value) => FirebaseFirestore.instance
          .collection("Users")
          .doc(value.user!.uid)
          .set({"name": name}))
      .then((value) => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => firstUI())));
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

Future<void> anonymous() {
  return auth.signInAnonymously().then((value) => FirebaseFirestore.instance
      .collection("Users")
      .doc(value.user!.uid)
      .set({"name": "Anonymous"}));
}
