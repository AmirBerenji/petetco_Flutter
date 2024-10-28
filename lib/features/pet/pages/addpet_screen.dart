import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final ImagePicker _picker = ImagePicker();
  String? imagePath;

  final TextEditingController _petName = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _passportNumber = TextEditingController();
  final TextEditingController _chipsetNumber = TextEditingController();

  Future<void> setPicPath(ImageSource imgSource) async {
    final XFile? pickedFile = await _picker.pickImage(source: imgSource);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return Scaffold(
        backgroundColor: Styles.bgColor,
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 110, right: 110),
              child: Container(
                width: 150,
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    border: Border.all(width: 1, color: Styles.grey500),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                            File(imagePath ?? "assets/images/vet4.jpg")))),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 15),
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.edit_square,
                          color: Styles.green900,
                          size: 30,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        body: Column(
                          children: [
                            Gap(10),
                            CustomButton(
                              icon: Icon(Icons.photo_album_sharp),
                              width: 250,
                              height: 50,
                              borderColor: Styles.grey600,
                              color: Styles.grey400,
                              text: Text(
                                "Gallery",
                                style: Styles.headLineStyle3,
                              ),
                              onTap: () async {
                                await setPicPath(ImageSource.gallery);
                              },
                            ),
                            Gap(10),
                            CustomButton(
                              icon: const Icon(Icons.camera_enhance),
                              width: 250,
                              height: 50,
                              borderColor: Styles.grey600,
                              color: Styles.grey400,
                              text: Text(
                                "Camera",
                                style: Styles.headLineStyle3,
                              ),
                              onTap: () async {
                                await setPicPath(ImageSource.camera);
                              },
                            )
                          ],
                        ),
                        dialogType: DialogType.noHeader,
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 30, top: 0),
                      ).show();
                    },
                  ),
                ]),
              ),
            ),
            Gap(AppLayout.getHeight(20)),
            Column(
              children: [
                CustomTextField(
                  hintText: "Pet Name",
                  controller: _petName,
                  hintStyle: TextStyle(color: Styles.grey600),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                Gap(AppLayout.getHeight(15)),
                
                
                

                Gap(AppLayout.getHeight(15)),
                CustomTextField(
                  hintText: "Birthday",
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now()
                            .add(const Duration(days: -(365 * 30))),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      _dob.text = date.toString().substring(0, 10);
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  controller: _dob,
                  hintStyle: TextStyle(color: Styles.grey600),
                  keyboardType: TextInputType.none,
                  textInputAction: TextInputAction.next,
                ),
                Gap(AppLayout.getHeight(15)),
                CustomTextField(
                  hintText: "Gender",
                  controller: _gender,
                  hintStyle: TextStyle(color: Styles.grey600),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                Gap(AppLayout.getHeight(15)),
                CustomTextField(
                  hintText: "Passport Number",
                  controller: _passportNumber,
                  hintStyle: TextStyle(color: Styles.grey600),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                Gap(AppLayout.getHeight(15)),
                CustomTextField(
                  hintText: "Chipset Number",
                  controller: _chipsetNumber,
                  hintStyle: TextStyle(color: Styles.grey600),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                Gap(AppLayout.getHeight(35)),
                CustomButton(
                    width: AppLayout.getWidth(300),
                    height: AppLayout.getHeight(55),
                    borderColor: Styles.greenButton,
                    color: Styles.greenButton,
                    text: Text(
                      "Save",
                      style:
                          Styles.headLineStyle3.copyWith(color: Styles.grey100),
                    ))
              ],
            )
          ],
        ));
  }
}
