import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class loginScr extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightScr(context) * 0.11,
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
                      Provider.of<languages>(context).tLogin(),
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
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
                height: heightScr(context) * 0.3,
                width: widthScr(context) * 0.9,
              ),
              SizedBox(
                height: heightScr(context) * 0.03,
              ),
              DefaultTextField(
                Provider.of<languages>(context).tEmail(),
                Icons.email,
                textController: emailController,
              ),
              SizedBox(
                height: heightScr(context) * 0.01,
              ),
              DefaultTextField(
                Provider.of<languages>(context).tPassword(),
                Icons.password,
                secure: true,
                sufIcon: Icons.visibility_off,
                onSufIconTap: () {},
                textController: passwordController,
              ),
              // SizedBox(
              //   height: heightScr(context) * 0.06,
              //   width: widthScr(context) * 0.85,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: greyColor(),
              //       hintText: 'Password',
              //       border: const OutlineInputBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(30),
              //           ),
              //           borderSide: BorderSide.none),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: heightScr(context) * 0.03,
              ),
              Container(
                height: heightScr(context) * 0.05,
                width: widthScr(context) * 0.85,
                decoration: BoxDecoration(
                    color: mainColor(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: TextButton(
                    onPressed: () {
                      signIn(emailController.text.toString(),
                          passwordController.text.toString(), context);
                    },
                    child: Text(
                      Provider.of<languages>(context).tLogin(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signupScr');
                      },
                      child: Text(
                          Provider.of<languages>(context).tCreateAccount())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
