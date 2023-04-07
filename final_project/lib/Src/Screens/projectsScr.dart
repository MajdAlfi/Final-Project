import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/greyColor.dart';
import 'package:final_project/Src/Services/mainColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/defaultProject.dart';

class ProjectsScr extends StatelessWidget {
  const ProjectsScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: heightScr(context) * 0.05,
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Projects",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        SizedBox(
          height: heightScr(context) * 0.836,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return defaultProject(context, "Tree Plantation");
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: 6),
        ),
      ],
    ));
  }
}
