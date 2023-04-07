import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Services/mainColor.dart';

class ProjectPreview extends StatelessWidget {
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
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        height: heightScr(context) * 0.25,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(
                              flex: 2,
                            ),
                            Text(
                              "Tree",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Erbil, Iraq",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.av_timer,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "16/4/2023",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Goal",
                                ),
                                Spacer(),
                                Text(
                                  "100",
                                ),
                              ],
                            ),
                            SizedBox(
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
                        "3K",
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
                  top: 20,
                  left: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
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
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "Overview",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ldskjflsdkjfslkdjfslkdjflskdjflsdkjflskdjfldskjfldkjlskjflksjdlksjflksjlfkjslkdjflskjdflksjdflksjldkfjsdlkdfjdslkjfdlkjflsdkjflsdkjflsdkfjdkjdslkjldkjfldskjflsdkjfslkdjfslkdjflskdjflsdkjflskdjfldskjfldkjlskjflksjdlksjflksjlfkjslkdjflskjdflksjdflksjldkfjsdlkdfjdslkjfdlkjflsdkjflsdkjflsdkfjdkjdslkjldkjfldskjflsdkjfslkdjfslkdjflskdjflsdkjflskdjfldskjfldkjlskjflksjdlksjflksjlfkjslkdjflskjdflksjdflksjldkfjsdlkdfjdslkjfdlkjflsdkjflsdkjflsdkfjdkjdslkjldkjfldskjflsdkjfslkdjfslkdjflskdjflsdkjflskdjfldskjfldkjlskjflksjdlksjflksjlfkjslkdjflskjdflksjdflksjldkfjsdlkdfjdslkjfdlkjflsdkjflsdkjflsdkfjdkjdslkjldkjfldskjflsdkjfslkdjfslkdjflskdjflsdkjflskdjfldskjfldkjlskjflksjdlksjflksjlfkjslkdjflskjdflksjdflksjldkfjsdlkdfjdslkjfdlkjflsdkjflsdkjflsdkfjdkjdslkjldkjf",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                    title: Text(
                      "San Samir",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                        "Norem ipsum dolor sit amet, consectetur adipiscing elit."),
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
