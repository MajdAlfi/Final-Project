import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
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
        SizedBox(
          height: heightScr(context) * 0.08,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            height: heightScr(context) * 0.05,
            child: const Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                "Projects",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        SizedBox(
          height: heightScr(context) * 0.756,
          child: ListView.separated(
              padding: EdgeInsets.only(top: 15),
              itemBuilder: (context, index) {
                return defaultProject(context, "Tree Plantation");
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: 6),
        ),
      ],
    ));
  }
}
