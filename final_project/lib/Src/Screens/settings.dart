import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Widgets/askLoginDialog.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:final_project/Src/Widgets/defaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../Services/Others/Width&Height.dart';
import '../Services/Others/dataprovider.dart';
import '../Widgets/defaultDropDownButton.dart';
import '../Widgets/defaultSettingsButton.dart';

class SettingScr extends StatelessWidget {
  SettingScr({super.key});
  TextEditingController newName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController setGoal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(Provider.of<languages>(context).tSettings()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: heightScr(context) * 0.02,
            ),
            GestureDetector(
                onTap: () {
                  anonymousCheck()
                      ? askLoginDialog(
                          context,
                          Provider.of<languages>(context, listen: false)
                              .tLoginToUseFeature())
                      : showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return Container(
                              height: heightScr(context) * 0.7,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: heightScr(context) * 0.02,
                                    ),
                                    Text(
                                      Provider.of<languages>(context)
                                          .tEditYourData(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: heightScr(context) * 0.02,
                                    ),
                                    DefaultTextField(
                                      Provider.of<languages>(context)
                                          .tNewName(),
                                      Icons.person_outline,
                                      textController: newName,
                                    ),
                                    SizedBox(
                                      height: heightScr(context) * 0.01,
                                    ),
                                    DefaultTextField(
                                      Provider.of<languages>(context)
                                          .tWriteDescription(),
                                      Icons.description,
                                      textController: description,
                                    ),
                                    SizedBox(
                                      height: heightScr(context) * 0.01,
                                    ),
                                    DefaultTextField(
                                      Provider.of<languages>(context)
                                          .tSetGoal(),
                                      Icons.grade_outlined,
                                      textController: setGoal,
                                    ),
                                    SizedBox(
                                      height: heightScr(context) * 0.08,
                                    ),
                                    defaultElevatedButton(context,
                                        Provider.of<languages>(context).tEdit(),
                                        () {
                                      Provider.of<dataprovider>(context,
                                              listen: false)
                                          .editUser(newName, setGoal,
                                              description, context);
                                    })
                                  ],
                                ),
                              ),
                            );
                          });
                },
                child: SettingsButton(
                    Provider.of<languages>(context).tEditProfile(),
                    Icon(Icons.arrow_forward_ios))),
            SizedBox(
              height: heightScr(context) * 0.01,
            ),
            SettingsButton(Provider.of<languages>(context).tSelectLanguage(),
                LanguageDropdown()),
            SizedBox(
              height: heightScr(context) * 0.01,
            ),
            SettingsButton(Provider.of<languages>(context).tAbout(),
                Icon(Icons.info_outline)),
            SizedBox(
              height: heightScr(context) * 0.08,
            ),
            anonymousCheck()
                ? defaultElevatedButton(
                    context, Provider.of<languages>(context).tLogin(), () {
                    askLoginDialog(
                        context,
                        Provider.of<languages>(context, listen: false)
                            .tAskLogin());
                  })
                : defaultElevatedButton(
                    context, Provider.of<languages>(context).tSignOut(),
                    bgColor: Colors.red, () {
                    Provider.of<dataprovider>(context, listen: false)
                        .signOut(context);
                  })
          ],
        ),
      ),
    );
  }
}
