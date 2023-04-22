import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/userModel.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

getCurrentUser(context) async {
  final userData =
      await FirebaseFirestore.instance.collection("Users").doc(getUid()).get();
  final user = userModel(
      name: userData['name'],
      actionsCompleted: userData['ActionsCompleted'],
      points: userData['points']);
  Provider.of<dataprovider>(context, listen: false).changeUserData(user);
}

getUid() {
  return FirebaseAuth.instance.currentUser!.uid;
}

bool anonymousCheck() {
  return FirebaseAuth.instance.currentUser!.isAnonymous;
}