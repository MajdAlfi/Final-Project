import 'dart:io';

import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Auth/authentication.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:final_project/Src/Widgets/defaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Services/Others/dataprovider.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController nameController = TextEditingController();
  bool passwordshow = true;
  bool confirmPasswordshow = true;
  @override
  void initState() {
    print(Provider.of<dataprovider>(context, listen: false).userData);
    // TODO: implement initState
    super.initState();
    Provider.of<dataprovider>(context, listen: false).profileIMG = "";
  }

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
                        Provider.of<languages>(context).tSignUp(),
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
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: Provider.of<dataprovider>(context)
                                      .profileIMG !=
                                  null &&
                              Provider.of<dataprovider>(context).profileIMG !=
                                  ""
                          ? FileImage(File(
                              Provider.of<dataprovider>(context).profileIMG!))
                          : AssetImage(
                              "assets/images/defaultProfileImage.jpg",
                            ) as ImageProvider,
                    ),
                    CircleAvatar(
                      backgroundColor: mainColor(),
                      radius: 18,
                      child: IconButton(
                          onPressed: () async {
                            try {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (pickedFile != null) {
                                CroppedFile? cropImg =
                                    await ImageCropper.platform.cropImage(
                                  sourcePath: pickedFile.path,
                                );
                                if (cropImg != null)
                                  Provider.of<dataprovider>(context,
                                          listen: false)
                                      .changeProfileImgPath(cropImg.path);
                              }
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: heightScr(context) * 0.05,
                ),
                DefaultTextField(
                  Provider.of<languages>(context).tName(),
                  Icons.perm_identity,
                  textController: nameController,
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
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
                  secure: passwordshow,
                  sufIcon: Icons.visibility_off_rounded,
                  onSufIconTap: () {
                    setState(() {
                      passwordshow = !passwordshow;
                    });
                  },
                  textController: passwordController,
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                DefaultTextField(
                  Provider.of<languages>(context).tConfirmPassword(),
                  Icons.password,
                  textController: confirmPassword,
                  secure: confirmPasswordshow,
                  sufIcon: Icons.visibility_off_rounded,
                  onSufIconTap: () {
                    setState(() {
                      confirmPasswordshow = !confirmPasswordshow;
                    });
                  },
                ),
                SizedBox(
                  height: heightScr(context) * 0.02,
                ),
                defaultElevatedButton(
                  context,
                  Provider.of<languages>(context).tSignUp(),
                  () {
                    if (confirmPassword.text == passwordController.text) {
                      register(
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          nameController.text.toString(),
                          File(Provider.of<dataprovider>(context, listen: false)
                              .profileIMG!),
                          context);
                    } else {
                      Fluttertoast.showToast(
                          msg: Provider.of<languages>(context, listen: false)
                              .tNotMatchPassword(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey[600],
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
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
                      Provider.of<languages>(context).tAlready(),
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
