import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/authentication.dart';
import 'package:final_project/Src/Services/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:final_project/Src/Widgets/defaultTextField.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: heightScr(context) * 0.08,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 27,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: mainColor(),
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightScr(context) * 0.05,
                ),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/defaultProfileImage.jpg",
                  ),
                ),
                SizedBox(
                  height: heightScr(context) * 0.05,
                ),
                DefaultTextField(
                  "Name",
                  Icons.perm_identity,
                  textController: nameController,
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                DefaultTextField(
                  "Email",
                  Icons.email,
                  textController: emailController,
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                DefaultTextField(
                  "Password",
                  Icons.password,
                  secure: true,
                  sufIcon: Icons.visibility_off_rounded,
                  onSufIconTap: () {},
                  textController: passwordController,
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                DefaultTextField(
                  "Confirm Password",
                  Icons.password,
                  secure: true,
                  sufIcon: Icons.visibility_off_rounded,
                  onSufIconTap: () {},
                ),
                SizedBox(
                  height: heightScr(context) * 0.02,
                ),
                defaultElevatedButton(
                  context,
                  "Sign UP",
                  () {
                    register(
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        nameController.text.toString(),
                        context);
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/loginScr');
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
