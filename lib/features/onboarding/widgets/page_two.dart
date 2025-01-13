import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
       return  Scaffold(
      backgroundColor: Styles.bgColor,
      body:
       Stack(

         children: [
          const Image(image: AssetImage("assets/images/page2.jpg"), ),
          Column(
          children: [
            SizedBox(
              width:AppLayout.getScreenWidth(),
              height: AppLayout.getScreenHeight()* 0.6,
            ),
            Container(
              width:AppLayout.getScreenWidth(),
              height: AppLayout.getScreenHeight()* 0.4,
              decoration: BoxDecoration(
                color: Styles.green900,
                borderRadius: BorderRadius.only(topRight: Radius.circular(AppLayout.getHeight(150))),
              ),
              child: Container(
                padding: EdgeInsets.only(right: AppLayout.getHeight(30),left: AppLayout.getHeight(30),top: AppLayout.getHeight(20)),
                child:  Text(
                "Here are our top tips for staying on top of your pet's needs.",
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