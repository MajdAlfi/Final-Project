import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultProject.dart';
import 'package:final_project/Src/Widgets/natureFactsWidget.dart';
import 'package:final_project/Src/Widgets/showBottomSheetActionProject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../Services/Auth/getCurrentUser.dart';
import '../Services/Others/languagesProvider.dart';

class homeScr extends StatelessWidget {
  homeScr({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor(),
        body: (context.watch<dataprovider>().userData == null)
            ? const Center(
                child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ))
            : Stack(
                children: [
                  Positioned(
                      top: heightScr(context) * 0.09,
                      left: widthScr(context) * 0.1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            context
                                .read<dataprovider>()
                                .userData!
                                .name
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          // Visibility(
                          //   visible: anonymousCheck(),
                          //   child: Text(
                          //     getUid(),
                          //     style: const TextStyle(color: Colors.white),
                          //   ),
                          // )
                        ],
                      )),
                  Positioned(
                      top: heightScr(context) * 0.125,
                      left: widthScr(context) * 0.1,
                      child: Text(
                        context.watch<dataprovider>().userData!.desc.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      )),
                  Positioned(
                      top: heightScr(context) * 0.15,
                      left: (context.read<dataprovider>().userData!.points! >
                              1000)
                          ? widthScr(context) * 0.1
                          : widthScr(context) * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            context
                                .watch<dataprovider>()
                                .userData!
                                .points
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            Provider.of<languages>(context).tPoint(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: heightScr(context) * 0.66,
                      width: widthScr(context),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: heightScr(context) * 0.08,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  Provider.of<languages>(context)
                                      .tNatureFacts(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightScr(context) * 0.03,
                            ),
                            Container(
                              height: heightScr(context) * 0.1,
                              width: widthScr(context),
                              child: ListView.separated(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    natureFactsWidget(
                                        fact: context
                                            .read<dataprovider>()
                                            .natureFact[index]['natureFact']),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount: context
                                    .read<dataprovider>()
                                    .natureFact
                                    .length,
                              ),
                            ),
                            SizedBox(
                              height: heightScr(context) * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  Provider.of<languages>(context)
                                      .tTopProjects(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightScr(context) * 0.02,
                            ),
                            FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection("Projects")
                                  .get(),
                              builder: (context, snapshot) => snapshot
                                          .connectionState ==
                                      ConnectionState.waiting
                                  ? SizedBox()
                                  : Container(
                                      height: heightScr(context) * 0.31,
                                      child: ListView.separated(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            defaultProject(
                                                context,
                                                snapshot.data!.docs[index]
                                                    ["title"],
                                                snapshot.data!.docs[index]
                                                    ["projectIMG"],
                                                DateFormat('yyyy/MM/dd').format(
                                                    snapshot
                                                        .data!
                                                        .docs[index]
                                                            ["expireDate"]
                                                        .toDate()),
                                                snapshot.data!.docs[index]
                                                    ["currentPoints"],
                                                snapshot.data!.docs[index]
                                                    ["Goal"],
                                                snapshot.data!.docs[index]
                                                    ["overview"],
                                                snapshot.data!.docs[index]
                                                    ["uid"],
                                                snapshot.data!.docs[index]
                                                    ["Location"],
                                                snapshot.data!.docs[index]
                                                    ["ProjectID"]),
                                        // Container(
                                        //   color: greyColor(),
                                        //   height: heightScr(context) * 0.25,
                                        //   width: widthScr(context) * 0.85,
                                        // ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          width: 10,
                                        ),
                                        itemCount: snapshot.data!.docs.length,
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: heightScr(context) * 0.05,
                      right: -20,
                      child: SizedBox(
                          height: heightScr(context) * 0.3,
                          width: widthScr(context) * 0.6,
                          child: Image.asset('assets/images/tree.png'))),
                ],
              ));
  }
}
