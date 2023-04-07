import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/greyColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/defaultTextField.dart';

class AddProject extends StatelessWidget {
  const AddProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Add Project"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: heightScr(context) * 0.30,
              color: greyColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Please choose a picture for your project",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const Icon(
                    Icons.photo,
                    size: 75,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: defaultElevatedButton(
                              context, "From Gallery", () {},
                              icon: Icons.photo_library_rounded)),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: defaultElevatedButton(
                              context, "From Camera", () {},
                              icon: Icons.camera_alt))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField("Title", Icons.title),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField("Expire Date", Icons.av_timer),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField("Goals", Icons.grade),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField(
                    "Location",
                    Icons.location_on,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultElevatedButton(context, "Apply", () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
