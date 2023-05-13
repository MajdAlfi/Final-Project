import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Home/saveIndexRank.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Widgets/leaderboardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class listBuilderLeaderBoard extends StatefulWidget {
  listBuilderLeaderBoard({
    super.key,
  });
  int i = 0;
  @override
  State<listBuilderLeaderBoard> createState() => _listBuilderLeaderBoardState();
}

class _listBuilderLeaderBoardState extends State<listBuilderLeaderBoard> {
  String uid = getUid();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection("Users")
            .orderBy("points", descending: true)
            .limit(20)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Align(
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 35),
                    itemBuilder: (context, index) {
                      return leaderboardWidget(
                        index: index + 1,
                        name: snapshot.data!.docs[index]["name"],
                        pts: snapshot.data!.docs[index]["points"],
                        uid: snapshot.data!.docs[index].id,
                        myUid: uid,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: snapshot.data!.docs.length),
              ),
            );
          }
          return Text('Err');
        });
  }
}
