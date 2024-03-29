import 'package:final_project/Src/Services/Home/addPoints.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Services/Projects/addProjectSupported.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future askSupportAlert(context, int supProject) async {
  return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            title: const Icon(Icons.question_mark),
            content: Text(Provider.of<languages>(context).tNote()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    Provider.of<languages>(context).tCancel(),
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  height: heightScr(context) * 0.045,
                  width: widthScr(context) * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: mainColor()),
                  child: TextButton(
                    onPressed: () async {
                      await addProjectSupported(supProject, context);
                      await Provider.of<dataprovider>(context, listen: false)
                          .addSupporedProjects(supProject);
                      await addPoints(10, context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      Provider.of<languages>(context).tSupport(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ))
            ],
          ));
}
