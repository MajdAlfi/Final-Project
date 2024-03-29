import 'package:final_project/Src/Screens/firstUi.dart';
import 'package:final_project/Src/Screens/homeScr.dart';
import 'package:final_project/Src/Screens/loginScr.dart';
import 'package:final_project/Src/Screens/onBoarding.dart';
import 'package:final_project/Src/Screens/profileScr.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:final_project/Src/Screens/projectsScr.dart';
import 'package:final_project/Src/Screens/signUp.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget Home;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('firstTime') == null) {
    prefs.setBool('firstTime', true);
  } else {
    prefs.setBool('firstTime', false);
  }
  if (prefs.getBool('firstTime') == true) {
    Home = OnBoarding();
  } else {
    Home = firstUI();
  }
  FirebaseAuth.instance.currentUser != null ? null : await anonymous();
  // anonymous();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return languages();
        },
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return dataprovider(context);
        },
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginScr': (context) => loginScr(),
        '/signupScr': (context) => SignUp()
      },
      home: Home,
    ),
  ));
}
