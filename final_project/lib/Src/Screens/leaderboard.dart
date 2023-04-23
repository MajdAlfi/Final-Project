import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/leaderboardWidget.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.95,
      color: mainColor(),
      child: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Users")
            .orderBy("points", descending: true)
            .get(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? SizedBox()
            : Stack(
                children: [
                  Positioned(
                    top: heightScr(context) * 0.17,
                    left: widthScr(context) * 0.125,
                    child: const Center(
                        child: Text(
                      'Rank:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Positioned(
                    top: heightScr(context) * 0.08,
                    left: widthScr(context) * 0.325,
                    child: Container(
                      height: heightScr(context) * 0.15,
                      width: widthScr(context) * 0.35,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        "1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: heightScr(context) * 0.64,
                      width: widthScr(context),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: ListView.separated(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 35),
                          itemBuilder: (context, index) => leaderboardWidget(
                                index: index + 1,
                                name: snapshot.data!.docs[index]["name"],
                                pts: snapshot.data!.docs[index]["points"],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: snapshot.data!.docs.length),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
