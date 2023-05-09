import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Models/actionButtonListType.dart';
import 'package:final_project/Src/Models/pointsModel.dart';
import 'package:final_project/Src/Models/userModel.dart';
import 'package:final_project/Src/Screens/firstUI.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Home/analysisPoints.dart';
import 'package:final_project/Src/Services/Others/actionButtonList.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class dataprovider extends ChangeNotifier {
  dataprovider(this.context);
  BuildContext context;
  int rank = 0;
  List<actionButtonListType>? btnList;
  List natureFact = [];
  List listPoints = [];
  userModel? userData;
  String? projectImgPath;
  String? profileIMG;

  DateRangePickerController? datePickerProject;
  changeIsSelectedGroupBtn(bool isSelected, int index) {
    btnList!.elementAt(index).isSeleccted = isSelected;
    notifyListeners();
  }

  fillAction(lang) {
    btnList = actionButtonList(lang);
    notifyListeners();
  }

  changeNatureFact(List facts) {
    natureFact = facts;
    notifyListeners();
  }

  changeListPoints(List<pointsModel> pts) {
    listPoints = pts;
    notifyListeners();
  }

  addListPoints(pointsModel pts) {
    listPoints.add(pts);
    notifyListeners();
  }

  changeUserData(userModel user) {
    userData = user;
    notifyListeners();
  }

  changeRank(int leader) {
    rank = leader;
    notifyListeners();
  }

  changeUserDataPoints(int points) {
    if (userData != null) {
      userData!.points = userData!.points! + points;
    }

    notifyListeners();
  }

  addSupporedProjects(int pro) {
    if (userData != null) {
      userData!.supportedProjects!.add(pro);
    }

    notifyListeners();
  }

  addYourProjects(int pro) {
    if (userData != null) {
      userData!.yourProject!.add(pro);
    }

    notifyListeners();
  }

  changeUserDataActionComp(int action) {
    if (userData != null) {
      userData!.actionsCompleted = userData!.actionsCompleted! + action;
    }
    notifyListeners();
  }

  changeDatePickerProject(DateRangePickerController date) {
    datePickerProject = date;
    notifyListeners();
  }

  changeProjectImgPath(String img) {
    projectImgPath = img;
    notifyListeners();
  }

  changeProfileImgPath(String img) {
    print(img);
    // print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOo");
    profileIMG = img;
    notifyListeners();
  }

  bool isLoading = false;
  signOut(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut().then((value) async {
      await anonymous().then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => firstUI(),
          )));
      userData = userModel();
      profileIMG = "";
      listPoints.clear();
    });

    notifyListeners();
  }

  void editUser(TextEditingController name, TextEditingController goal,
      TextEditingController desc, BuildContext context) async {
    print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    print(goal.text.trim().isEmpty);

    await FirebaseFirestore.instance.collection("Users").doc(getUid()).update({
      "name": name.text.trim() == "" ? userData!.name : name.text,
      "description": desc.text.trim() == "" ? userData!.desc : desc.text,
      "goal": goal.text.trim().isEmpty ? userData!.goal : int.parse(goal.text)
    }).then((value) {
      userData!.name = name.text.isEmpty ? userData!.name : name.text;
      userData!.goal =
          goal.text.trim().isEmpty ? userData!.goal : int.parse(goal.text);
      userData!.desc = desc.text.trim() == "" ? userData!.desc : desc.text;
      Navigator.pop(context);
    });

    notifyListeners();
  }
}
