import 'package:final_project/Src/Screens/firstUi.dart';
import 'package:final_project/Src/Screens/homeScr.dart';
import 'package:final_project/Src/Screens/profileScr.dart';
import 'package:final_project/Src/Screens/projectsScr.dart';
import 'package:final_project/Src/Services/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return dataprovider();
        },
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstUI(),
    ),
  ));
}
