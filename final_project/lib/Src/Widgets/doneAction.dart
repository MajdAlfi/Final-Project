import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Home/ActionsCompleted.dart';
import 'package:final_project/Src/Services/Home/addPoints.dart';
import 'package:final_project/Src/Services/Home/analysisPoints.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/askLoginDialog.dart';
import 'package:final_project/Src/Widgets/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class doneAction extends StatelessWidget {
  const doneAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: widthScr(context) * 0.27,
        height: heightScr(context) * 0.045,
        decoration: BoxDecoration(
            color: mainColor(),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: TextButton(
          onPressed: () async {
            laodingDialog(context);
            final auth = FirebaseAuth.instance;
            final length =
                context.read<dataprovider>().btnList!.where((element) {
              return element.isSeleccted == true;
            }).length;
            for (int i = 0; i < length; i++) {
              print(length);
              final btnList =
                  context.read<dataprovider>().btnList!.where((element) {
                return element.isSeleccted == true;
              });
              btnList.forEach((element) {
                print(element.name);
                FirebaseFirestore.instance
                    .collection("Users")
                    .doc(getUid())
                    .collection("Actions")
                    .doc(element.index.toString())
                    .set({"action": element.name, "date": DateTime.now()});
              });
              await addPoints(btnList.elementAt(i).pts, context);
            }
            await actionsCompleted(length, context);
            for (int i = 0; i < 10; i++) {
              Provider.of<dataprovider>(context, listen: false)
                  .changeIsSelectedGroupBtn(false, i);
            }
            await analysisPoints(context);
            Navigator.pop(context);
            Navigator.pop(context);

            if (auth.currentUser!.isAnonymous)
              askLoginDialog(context,
                  Provider.of<languages>(context, listen: false).tNotLogIn());
          },
          child: Text(
            Provider.of<languages>(context).tDone(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
