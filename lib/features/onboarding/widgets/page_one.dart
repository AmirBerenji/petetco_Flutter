import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body:
       Stack(

         children: [
          const Image(image: AssetImage("assets/images/page1.jpg"), ),
          Column(
          children: [
            SizedBox(
              width:AppLayout.getScreenWidth(),
              height: AppLayout.getScreenHeight()* 0.4,
            ),
            Container(
              width:AppLayout.getScreenWidth(),
              height: AppLayout.getScreenHeight()* 0.6,
              decoration: BoxDecoration(
                color: Styles.green900,
                borderRadius: BorderRadius.only(topRight: Radius.circular(AppLayout.getHeight(150))),
              ),
              child: Container(
                padding: EdgeInsets.only(right: AppLayout.getHeight(30),left: AppLayout.getHeight(30),top: AppLayout.getHeight(70)),
                child:  Text(
                "Managing your pet's health and wellbeing is essential to a happy life together.",
                style: Styles.headLineStyle1.copyWith(color: Styles.grey100,fontSize: 40),
              ),
              )
            ),
          
          ],
               ),
       ]) ,
    );
  }
}