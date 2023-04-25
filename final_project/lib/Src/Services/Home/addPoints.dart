import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/pointsModel.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:provider/provider.dart';

addPoints(int newPoints, context) async {
  final fire = FirebaseFirestore.instance;
  // final currentPoints = await fire
  //     .collection('Users')
  //     .doc(getUid())
  //     .get()
  //     .then((DocumentSnapshot value) => value.get('points'));
  // int points = currentPoints + newPoints;
  await fire
      .collection('Users')
      .doc(getUid())
      .update({'points': FieldValue.increment(newPoints)});
  Provider.of<dataprovider>(context, listen: false)
      .changeUserDataPoints(newPoints);
  final currentDate = DateTime.now();
  final docID = await fire.collection('Points').doc().id;
  await fire.collection('Points').doc(docID).set({
    "Point": newPoints,
    "Date": currentDate,
    "uid": getUid(),
    "docID": docID
  });
  Provider.of<dataprovider>(context, listen: false)
      .addListPoints(pointsModel(points: newPoints, gainedOn: currentDate));
}
