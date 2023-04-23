import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool checkSupported(BuildContext context, int projectID) {
  if (context
      .watch<dataprovider>()
      .userData!
      .supportedProjects!
      .toList()
      .contains(projectID)) {
    return true;
  } else {
    return false;
  }
}
