import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Services/Others/mainColor.dart';

class ProjectPreview extends StatelessWidget {
  ProjectPreview(
      {required this.title,
      required this.goal,
      required this.currentPoints,
      required this.expDate,
      required this.img,
      required this.location,
      required this.overView,
      required this.uid});
  String title;
  int goal;
  String location;
  int currentPoints;
  String img;
  String expDate;
  String uid;

  String overView =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque fringilla augue pretium mi mattis ultrices. Aliquam consequat iaculis ex, in cursus arcu congue at. Ut aliquam tellus erat, non convallis massa mattis ac. In hac habitasse platea dictumst. Sed vestibulum sapien eget vestibulum faucibus. Nulla odio arcu, pellentesque laoreet pellentesque eget, tincidunt ut felis. Nam vel elementum orci. Vestibulum eu elit est. Maecenas vestibulum ante at nisl mattis, nec tincidunt arcu semper. Vestibulum euismod, odio ac efficitur porta, massa nunc sagittis erat, in pretium metus sem eu nisl. Duis faucibus velit eu viverra euismod. In hac habitasse platea dictumst. Donec ac risus nisi. Aliquam et aliquam mauris. Phasellus dui mi, condimentum quis semper vel, facilisis nec eros. Etiam viverra ut nulla et sagittis. Praesent et velit dapibus, cursus elit at, vehicula tellus. Pellentesque';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: heightScr(context) * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.fill)),
                    ),
                    Container(
                        height: heightScr(context) * 0.25,
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
                              "$title",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "$location",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
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
                            const SizedBox(
                              height: 20,
                            ),
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
                                value: 80,
                                max: 100,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Container(
                  width: 75,
                  height: 75,
                  decoration:
                      BoxDecoration(color: mainColor(), shape: BoxShape.circle),
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
                ),
                Positioned(
                  top: 60,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  defaultElevatedButton(context, "Support Project", () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "Overview",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      overView,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(uid)
                        .get(),
                    builder: (context, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? SizedBox()
                            : ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 30,
                                ),
                                title: Text(
                                  snapshot.data!["name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                    "Norem ipsum dolor sit amet, consectetur adipiscing elit."),
                              ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
