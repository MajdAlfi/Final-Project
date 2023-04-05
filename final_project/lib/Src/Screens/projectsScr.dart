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
        body: ListView.separated(
            itemBuilder: (context, index) {
              return defaultProject(context, "Tree Plantation");
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: 6));
  }
}
