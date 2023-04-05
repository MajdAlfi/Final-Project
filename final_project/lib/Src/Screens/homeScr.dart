import 'package:final_project/Src/Services/mainColor.dart';
import 'package:flutter/material.dart';

class homeScr extends StatelessWidget {
  const homeScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: mainColor(),
        )
      ]),
    );
  }
}
