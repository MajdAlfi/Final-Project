import 'package:final_project/Src/Models/actionButtonListType.dart';
import 'package:final_project/Src/Models/userModel.dart';
import 'package:final_project/Src/Screens/firstUI.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Others/actionButtonList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class dataprovider extends ChangeNotifier {
  List<actionButtonListType> btnList = actionButtonList();
  List natureFact = [];
  userModel? userData;
  String? projectImgPath;
  DateRangePickerController? datePickerProject;
  changeIsSelectedGroupBtn(bool isSelected, int index) {
    btnList.elementAt(index).isSeleccted = isSelected;
    notifyListeners();
  }

  changeNatureFact(List facts) {
    natureFact = facts;
    notifyListeners();
  }

  changeUserData(userModel user) {
    userData = user;
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

  signOut(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut().then((value) async {
      await anonymous().then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => firstUI(),
          )));
      userData = userModel();
      anonymousSaveData(context);
    });

    notifyListeners();
  }
}
