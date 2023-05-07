import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Models/userModel.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Widgets/defaultProject.dart';

class SupportedProject extends StatelessWidget {
  SupportedProject(this.supportedProjects, {super.key});
  List supportedProjects = [];

  @override
  Widget build(BuildContext context) {
    print(supportedProjects.isEmpty);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Colors.black,
          title: Text("Projects",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              )),
        ),
        body: Column(
          children: [
            supportedProjects.isEmpty
                ? Container(
                    height: heightScr(context) * 0.85,
                    child: Center(
                        child: Text(
                      "You didnt support any projects",
                      style: TextStyle(fontSize: 25, color: mainColor()),
                    )))
                : FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("Projects")
                        .where("ProjectID", whereIn: supportedProjects)
                        .get(),
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.waiting
                        ? Container(
                            height: heightScr(context) * 0.6,
                            width: widthScr(context),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : supportedProjects.isEmpty
                            ? Container(
                                height: heightScr(context) * 0.85,
                                child: Text(Provider.of<languages>(context)
                                    .tYouDidntSupport()),
                              )
                            : SizedBox(
                                height: heightScr(context) * 0.85,
                                child: ListView.separated(
                                    padding: EdgeInsets.only(top: 15),
                                    itemBuilder: (context, index) {
                                      return defaultProject(
                                          context,
                                          snapshot.data!.docs[index]["title"],
                                          snapshot.data!.docs[index]
                                              ["projectIMG"],
                                          DateFormat('yyyy/MM/dd').format(
                                              snapshot.data!
                                                  .docs[index]["expireDate"]
                                                  .toDate()),
                                          snapshot.data!.docs[index]
                                              ["currentPoints"],
                                          snapshot.data!.docs[index]["Goal"],
                                          snapshot.data!.docs[index]
                                              ["overview"],
                                          snapshot.data!.docs[index]["uid"],
                                          snapshot.data!.docs[index]
                                              ["Location"],
                                          snapshot.data!.docs[index]
                                              ["ProjectID"]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 20,
                                        ),
                                    itemCount: snapshot.data!.docs.length),
                              ),
                  ),
          ],
        ));
  }
}
