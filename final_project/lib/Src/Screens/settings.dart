import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../Services/Others/dataprovider.dart';

class SettingScr extends StatelessWidget {
  const SettingScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: defaultElevatedButton(context, "SignOut",
                bgColor: Colors.red, () {
              Provider.of<dataprovider>(context, listen: false)
                  .signOut(context);
            }),
          )
        ],
      ),
    );
  }
}
