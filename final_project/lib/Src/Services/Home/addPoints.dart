import 'package:cloud_firestore/cloud_firestore.dart';
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
  await fire
      .collection('Points')
      .doc()
      .set({"Point": newPoints, "Date": currentDate, "uid": getUid()});
}
