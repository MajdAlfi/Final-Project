import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class rankSquare extends StatelessWidget {
  const rankSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("Users")
          .orderBy("points", descending: true)
          .get(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Icon(Icons.leaderboard)
              : Text(
                  (snapshot.data!.docs
                              .indexWhere((element) => element.id == getUid()) +
                          1)
                      .toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
    );
  }
}
