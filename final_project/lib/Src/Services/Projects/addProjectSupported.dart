import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Others/dataprovider.dart';

Future addProjectSupported(int supProject, BuildContext context) async {
  final fire = FirebaseFirestore.instance;
  await fire.collection('Users').doc(getUid()).update({
    "supportedProject": FieldValue.arrayUnion([supProject])
  });

  final docID = await fire
      .collection('Projects')
      .where("ProjectID", isEqualTo: supProject)
      .get()
      .then((QuerySnapshot snap) => snap.docs.map((DocumentSnapshot e) {
            if (e.exists) {
              return e.get('docID');
            }
          }));

  await fire
      .collection('Projects')
      .doc(docID.elementAt(0))
      .update({"currentPoints": FieldValue.increment(1)});
}
