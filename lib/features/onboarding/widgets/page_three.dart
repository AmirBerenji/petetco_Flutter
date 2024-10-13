import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
       return  Scaffold(
      backgroundColor: Styles.bgColor,
      body:
       Stack(

         children: [
          const Image(image: AssetImage("assets/images/page3.jpg"),fit: BoxFit.fill,width: double.infinity,  ),
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
                 child:
                Row(
                  children: [
                    CustomButton(
                      onTap: (){},
                      width: AppLayout.getScreenWidth() * 0.7, 
                      height: AppLayout.getHeight(50), 
                      borderColor: Styles.grey200, 
                      text: Text(
                        "Login",
                        style: Styles.headLineStyle3.copyWith(color: Styles.grey100),

                      ),
                      color: Styles.orange800,
                      )
                  ],
                ), 

              )
            ),
          
          ],
               ),
       ]) ,
    );
  }
}