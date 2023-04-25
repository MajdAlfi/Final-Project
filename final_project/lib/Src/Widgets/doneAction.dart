import 'package:final_project/Src/Services/Home/ActionsCompleted.dart';
import 'package:final_project/Src/Services/Home/addPoints.dart';
import 'package:final_project/Src/Services/Home/analysisPoints.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/askLoginDialog.dart';
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
            final auth = FirebaseAuth.instance;
            final length = context
                .read<dataprovider>()
                .btnList
                .where((element) => element.isSeleccted == true)
                .length;
            for (int i = 0; i < length; i++) {
              await addPoints(
                  context
                      .read<dataprovider>()
                      .btnList
                      .where((element) => element.isSeleccted == true)
                      .elementAt(i)
                      .pts,
                  context);
            }
            await actionsCompleted(length, context);
            for (int i = 0; i < 10; i++) {
              Provider.of<dataprovider>(context, listen: false)
                  .changeIsSelectedGroupBtn(false, i);
            }
            await analysisPoints(context);
            Navigator.pop(context);
            if (auth.currentUser!.isAnonymous) askLoginDialog(context);
          },
          child: const Text(
            'Done',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
