import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_dialog.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});
 
  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
 final ImagePicker _picker = ImagePicker();
 String? imagePath;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 110,right: 110),
            child: Container(
              width: 150,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                border: Border.all(width: 1, color: Styles.grey500),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(imagePath??"assets/images/vet4.jpg") )
                ))
              ,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(context: context,
                      body:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(width: 100, height: 50, borderColor: Colors.red, text: Text("Gallery"),
                          onTap: () async {
                
                            final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              imagePath = pickedFile?.path.toString(); 
                            });
                               
                          },
                          
                          ),
                          
                          CustomButton(width: 100, height: 50, borderColor: Colors.red, text: Text("Camera"),
                          
                          onTap: () async {
                
                            final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
                            imagePath = pickedFile?.path.toString(); 
                          },
                          
                          )
                        ],
                      ),
                      dialogType: DialogType.noHeader,
                      padding: EdgeInsets.all(30),
                      ).show();
                    },
                ),]
              ),
            ),
          ),
         
        ],
      )
    );
  }


}