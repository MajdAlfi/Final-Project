import 'package:final_project/Src/Screens/addProjectScr.dart';
import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/dataprovider.dart';
import 'package:final_project/Src/Services/greyColor.dart';
import 'package:final_project/Src/Services/mainColor.dart';
import 'package:final_project/Src/Widgets/actionBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Container(
                                          width: widthScr(context) * 0.27,
                                          height: heightScr(context) * 0.045,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: TextButton(
                                            onPressed: () {
                                              for (int i = 0; i < 10; i++) {
                                                Provider.of<dataprovider>(
                                                        context,
                                                        listen: false)
                                                    .changeIsSelectedGroupBtn(
                                                        false, i);
                                              }
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Container(
                                          width: widthScr(context) * 0.27,
                                          height: heightScr(context) * 0.045,
                                          decoration: BoxDecoration(
                                              color: mainColor(),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30))),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Done',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      )
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
                    children: const [
                      Text(
                        'Add Action',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProject()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Add Project',
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
