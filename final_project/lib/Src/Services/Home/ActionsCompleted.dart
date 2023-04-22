import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:provider/provider.dart';

actionsCompleted(int actions, context) async {
  final fire = FirebaseFirestore.instance;
  final currentAct = await fire
      .collection('Users')
      .doc(getUid())
      .get()
      .then((DocumentSnapshot value) => value.get('ActionsCompleted'));
  int actionComp = currentAct + actions;
  fire
      .collection('Users')
      .doc(getUid())
      .update({'ActionsCompleted': actionComp});
  Provider.of<dataprovider>(context, listen: false)
      .changeUserDataActionComp(actionComp);
}
