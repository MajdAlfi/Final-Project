import 'package:final_project/Src/Screens/addProjectScr.dart';
import 'package:final_project/Src/Screens/loginScr.dart';
import 'package:final_project/Src/Services/Home/addPoints.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Widgets/cancelAction.dart';
import 'package:final_project/Src/Widgets/doneAction.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/actionBottomSheet.dart';
import 'package:final_project/Src/Widgets/askLoginDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../Services/Auth/getCurrentUser.dart';

class showBottomSheetActionProject extends StatelessWidget {
  const showBottomSheetActionProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.3,
      width: widthScr(context),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: greyColor()),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: widthScr(context) * 0.6,
                height: heightScr(context) * 0.09,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<dataprovider>(context, listen: false)
                        .fillAction(
                            Provider.of<languages>(context, listen: false));
                    Navigator.pop(context);
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              const actionBottomSheet(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: heightScr(context) * 0.1,
                                  width: widthScr(context),
                                  color: greyColor(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      cancelAction(),
                                      doneAction()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Provider.of<languages>(context).tAddAction(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Icon(Icons.add_circle)
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: widthScr(context) * 0.6,
                height: heightScr(context) * 0.09,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: GestureDetector(
                  onTap: () {
                    if (anonymousCheck()) {
                      askLoginDialog(
                          context,
                          Provider.of<languages>(context, listen: false)
                              .tSorry());
                    } else {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProject()));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Provider.of<languages>(context).tAddProject(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '👏',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ))
          ]),
    );
  }
}
