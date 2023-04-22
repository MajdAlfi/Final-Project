import 'package:final_project/Src/Screens/firstUi.dart';
import 'package:final_project/Src/Screens/homeScr.dart';
import 'package:final_project/Src/Screens/loginScr.dart';
import 'package:final_project/Src/Screens/profileScr.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
      routes: {
        '/loginScr': (context) => loginScr(),
        '/signupScr': (context) => SignUp()
      },
      home: firstUI(),
    ),
  ));
}
