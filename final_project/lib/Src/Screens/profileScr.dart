import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:final_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Widgets/defaultShowPoints.dart';

class ProfileScr extends StatelessWidget {
  const ProfileScr({super.key});

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
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: heightScr(context),
                    color: mainColor(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightScr(context) * 0.05,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context
                                          .read<dataprovider>()
                                          .userData!
                                          .name
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      Provider.of<dataprovider>(context)
                                          .userData!
                                          .desc
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<dataprovider>(context,
                                          listen: false)
                                      .signOut(context);
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: heightScr(context) * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                "Goal",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Text(
                                Provider.of<dataprovider>(
                                  context,
                                ).userData!.goal.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                            child: DChartSingleBar(
                              radius: BorderRadius.circular(15),
                              forgroundColor: Colors.white,
                              value: Provider.of<dataprovider>(
                                context,
                              ).userData!.points!.toDouble(),
                              max: Provider.of<dataprovider>(
                                context,
                              ).userData!.goal!.toDouble(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightScr(context) * 0.015,
                  ),
                  Container(
                    width: widthScr(context),
                    padding: const EdgeInsets.all(10),
                    height: heightScr(context) * 0.65,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              defaultShowPoints(
                                  context,
                                  Provider.of<dataprovider>(
                                    context,
                                  ).userData!.points!,
                                  "Total Point"),
                              defaultShowPoints(
                                  context,
                                  Provider.of<dataprovider>(
                                    context,
                                  ).userData!.actionsCompleted!,
                                  "Action Completed"),
                              defaultShowPoints(
                                  context,
                                  Provider.of<dataprovider>(
                                    context,
                                  ).userData!.supportedProjects!.length,
                                  "Supported Project"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: defaultElevatedButton(
                                      context, "Your Projects", () {})),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: defaultElevatedButton(
                                      context, "Supported Projects", () {})),
                            ],
                          ),
                          TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                          ),
                          Container(
                            height: 150,
                            child: DChartBar(
                              data: const [
                                {
                                  'id': 'Bar',
                                  'data': [
                                    {'domain': '2020', 'measure': 3},
                                    {'domain': '2021', 'measure': 4},
                                    {'domain': '2022', 'measure': 6},
                                    {'domain': '2023', 'measure': 1},
                                  ],
                                },
                              ],
                              barColor: (Map<String, dynamic> barData,
                                  int? index, String id) {
                                return Colors.green;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}
