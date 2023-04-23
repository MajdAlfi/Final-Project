import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/userModel.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

getCurrentUser(context) async {
  if (anonymousCheck() == false) {
    final userData = await FirebaseFirestore.instance
        .collection("Users")
        .doc(getUid())
        .get();
    final user = userModel(
      name: userData['name'],
      actionsCompleted: userData['ActionsCompleted'],
      points: userData['points'],
      desc: userData['description'],
      goal: userData['goal'],
      supportedProjects: userData['supportedProject'],
      yourProject: userData['yourProject'],
    );
    print(user);
    Provider.of<dataprovider>(context, listen: false).changeUserData(user);
  }
}

getUid() {
  return FirebaseAuth.instance.currentUser!.uid;
}

bool anonymousCheck() {
  return FirebaseAuth.instance.currentUser!.isAnonymous;
}
