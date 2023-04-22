import 'package:final_project/Src/Screens/homeScr.dart';
import 'package:final_project/Src/Screens/leaderboard.dart';
import 'package:final_project/Src/Screens/profileScr.dart';
import 'package:final_project/Src/Screens/projectsScr.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Home/natureFactGet.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/showBottomSheetActionProject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class firstUI extends StatefulWidget {
  firstUI({super.key});
  int selectedIndex = 0;
  List pages = [homeScr(), ProjectsScr(), Leaderboard(), ProfileScr()];
  @override
  State<firstUI> createState() => _firstUIState();
}

class _firstUIState extends State<firstUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser != null ? null : anonymous(context);

    getCurrentUser(context);
    natureFactGet(context);

    // if (anonymousCheck() == false) {
    // getCurrentUser(context);
    // } else {
    // anonymous(context);
    // natureFactGet(context);
    // }
  }

  @override
  void _onTapFunc(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.pages.elementAt(widget.selectedIndex),
      bottomNavigationBar: Container(
        height: heightScr(context) * 0.114,
        width: widthScr(context),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color.fromARGB(150, 228, 228, 228)),
        child: BottomNavigationBar(
            onTap: _onTapFunc,
            currentIndex: widget.selectedIndex,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: mainColor(),
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.bold),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                  label: 'Explore', icon: Icon(Icons.travel_explore)),
              BottomNavigationBarItem(
                  label: 'Leaderboard', icon: Icon(Icons.leaderboard)),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person,
                ),
              ),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor(),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return const showBottomSheetActionProject();
              });
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
