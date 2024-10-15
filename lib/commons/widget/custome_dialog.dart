import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';

AwesomeDialog CustomAwesomeDialog(BuildContext context, String message, DialogType dialogKind) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogKind,
      borderSide: BorderSide(
        color: Styles.grey500,
        width: 5,
      ),
      width: 400,
      
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      body:Padding(
        padding: EdgeInsets.all(20),
        child: 
        Text(
          message,
          style: Styles.headLineStyle3.copyWith(color: Styles.grey900),
          ),
        )
      ,
      showCloseIcon: false,
    );
  }
  