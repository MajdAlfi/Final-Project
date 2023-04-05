import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/greyColor.dart';
import 'package:final_project/Src/Services/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Widgets/defaultShowPoints.dart';

class ProfileScr extends StatelessWidget {
  const ProfileScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: heightScr(context),
          color: mainColor(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "San Samir",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Norem ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 45,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Goal",
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      "100",
                      style: TextStyle(color: Colors.white),
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
                    forgroundColor: Colors.white,
                    value: 80,
                    max: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: widthScr(context),
          padding: EdgeInsets.all(10),
          height: heightScr(context) * 0.65,
          decoration: BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defaultShowPoints(context, 40, "Total Point"),
                    defaultShowPoints(context, 5, "Action Completed"),
                    defaultShowPoints(context, 25, "Supported Project"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: defaultElevatedButton(
                            context, "Your Projects", () {})),
                    SizedBox(
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
                    data: [
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
                    barColor:
                        (Map<String, dynamic> barData, int? index, String id) {
                      return Colors.green;
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
