import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../Widgets/defaultProject.dart';

class ProjectsScr extends StatelessWidget {
  const ProjectsScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: heightScr(context) * 0.08,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            height: heightScr(context) * 0.05,
            child: const Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Projects",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        FutureBuilder(
          future: FirebaseFirestore.instance.collection("Projects").get(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Container(
                      height: heightScr(context) * 0.6,
                      width: widthScr(context),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox(
                      height: heightScr(context) * 0.756,
                      child: ListView.separated(
                          padding: EdgeInsets.only(top: 15),
                          itemBuilder: (context, index) {
                            return defaultProject(
                                context,
                                snapshot.data!.docs[index]["title"],
                                snapshot.data!.docs[index]["projectIMG"],
                                DateFormat('yyyy/MM/dd').format(snapshot
                                    .data!.docs[index]["expireDate"]
                                    .toDate()),
                                snapshot.data!.docs[index]["currentPoints"],
                                snapshot.data!.docs[index]["Goal"],
                                snapshot.data!.docs[index]["overview"],
                                snapshot.data!.docs[index]["uid"],
                                snapshot.data!.docs[index]["Location"],
                                snapshot.data!.docs[index]["ProjectID"]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: snapshot.data!.docs.length),
                    ),
        ),
      ],
    ));
  }
}
