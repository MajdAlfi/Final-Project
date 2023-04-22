import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUser() async {
  return await FirebaseFirestore.instance
      .collection("Users")
      .doc(getUid())
      .get();
}

getUid() {
  return FirebaseAuth.instance.currentUser!.uid;
}

bool anonymousCheck() {
  return FirebaseAuth.instance.currentUser!.isAnonymous;
}
