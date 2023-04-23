import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Projects/uploadProject.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:final_project/Src/Widgets/showALertDialog.dart';
import 'package:final_project/Src/Widgets/showDatePickerContainer.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Widgets/defaultTextField.dart';

class AddProject extends StatelessWidget {
  AddProject({super.key});
  final titleField = TextEditingController();
  final goalField = TextEditingController();
  final locationField = TextEditingController();
  final overviewField = TextEditingController();
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
                  (context.watch<dataprovider>().projectImgPath != null &&
                          context.read<dataprovider>().projectImgPath != '')
                      ? Image.file(
                          File(
                            context.read<dataprovider>().projectImgPath!,
                          ),
                          height: heightScr(context) * 0.2,
                          width: widthScr(context),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                        )
                      : const Text(
                          "Please choose a picture for your project",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                  (context.watch<dataprovider>().projectImgPath != null &&
                          context.read<dataprovider>().projectImgPath != '')
                      ? Text('')
                      : const Icon(
                          Icons.photo,
                          size: 75,
                        ),
                  Row(
                    children: [
                      Expanded(
                          child: defaultElevatedButton(context, "From Gallery",
                              () async {
                        try {
                          final picker = ImagePicker();
                          final pickedFile = await picker.pickImage(
                              source: ImageSource.gallery,
                              maxHeight: 1080,
                              maxWidth: 1920);
                          if (pickedFile != null) {
                            CroppedFile? cropImg = await ImageCropper.platform
                                .cropImage(
                                    sourcePath: pickedFile.path,
                                    maxHeight: 1080,
                                    maxWidth: 1920,
                                    aspectRatio: const CropAspectRatio(
                                        ratioX: 16, ratioY: 9));
                            if (cropImg != null)
                              Provider.of<dataprovider>(context, listen: false)
                                  .changeProjectImgPath(cropImg.path);
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }, icon: Icons.photo_library_rounded)),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      // Expanded(
                      //     child: defaultElevatedButton(
                      //         context, "From Camera", () {},
                      //         icon: Icons.camera_alt))
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
                  DefaultTextField(
                    "Title",
                    Icons.title,
                    textController: titleField,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // DefaultTextField("Expire Date", Icons.av_timer),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  const showDatePickerContainer(),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField("Goal", Icons.grade,
                      textController: goalField),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField("Overview", Icons.list,
                      textController: overviewField),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextField(
                    "Location",
                    Icons.location_on,
                    textController: locationField,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultElevatedButton(context, "Post", () async {
                    if (context.read<dataprovider>().projectImgPath != null &&
                        context.read<dataprovider>().projectImgPath != '' &&
                        context.read<dataprovider>().datePickerProject !=
                            null &&
                        goalField.text != '' &&
                        overviewField.text != '' &&
                        titleField.text != '' &&
                        locationField.text != '') {
                      final file =
                          File(context.read<dataprovider>().projectImgPath!);
                      Timestamp tStamp = Timestamp.fromDate(context
                          .read<dataprovider>()
                          .datePickerProject!
                          .selectedDate!);
                      await uploadProject(
                          file,
                          titleField.text,
                          tStamp,
                          int.parse(goalField.text),
                          locationField.text,
                          overviewField.text,
                          context);
                      context.read<dataprovider>().changeProjectImgPath('');
                      goalField.text = '';
                      overviewField.text = '';
                      titleField.text = '';
                      locationField.text = '';
                    } else {
                      showAlertDialog(
                          context, 'Please fill in the required Data!');
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
