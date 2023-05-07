import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/leaderboardWidget.dart';
import 'package:final_project/Src/Widgets/listBuilderLeaderboard.dart';
import 'package:final_project/Src/Widgets/rankSquare.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/Others/languagesProvider.dart';

class Leaderboard extends StatelessWidget {
  Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.95,
      color: mainColor(),
      child: Stack(
        children: [
          Positioned(
            top: heightScr(context) * 0.17,
            left: widthScr(context) * 0.125,
            child: Center(
                child: Text(
              "${Provider.of<languages>(context).tRank()}:",
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
              child: const Center(child: rankSquare()),
            ),
          ),
          listBuilderLeaderBoard()
        ],
      ),
    );
  }
}
