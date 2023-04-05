import 'package:d_chart/d_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/Width&Height.dart';
import '../Services/mainColor.dart';

Widget defaultProject(
  BuildContext context,
  String label,
) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 0.05),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        height: heightScr(context) * 0.40,
        width: widthScr(context) * 0.9,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "$label",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(
                          height: 5,
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
                        Spacer(),
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
              "3K",
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
  );
}
