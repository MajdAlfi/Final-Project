import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Screens/projectPreviewScr.dart';
import 'package:flutter/material.dart';

import '../Services/Others/Width&Height.dart';
import '../Services/Others/mainColor.dart';

Widget defaultProject(
    BuildContext context,
    String label,
    String img,
    String expDate,
    int currentPoints,
    int goal,
    String overview,
    String uid,
    String location) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProjectPreview(
                  title: label,
                  img: img,
                  currentPoints: currentPoints,
                  expDate: expDate,
                  goal: goal,
                  overView: overview,
                  uid: uid,
                  location: location,
                ))),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.05)),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          height: heightScr(context) * 0.40,
          width: widthScr(context) * 0.95,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(img), fit: BoxFit.fill),
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          Text(
                            "$label",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.av_timer,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "$expDate",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                "Goal",
                              ),
                              Spacer(),
                              Text(
                                "$currentPoints",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 10,
                            child: DChartSingleBar(
                              radius: BorderRadius.circular(15),
                              forgroundColor: mainColor(),
                              value: currentPoints.toDouble(),
                              max: goal.toDouble(),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(color: mainColor(), shape: BoxShape.circle),
          child: Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5)),
              child: Center(
                  child: Text(
                goal > 1000 ? "${(goal / 1000).floor()}K" : "$goal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        )
      ],
    ),
  );
}
