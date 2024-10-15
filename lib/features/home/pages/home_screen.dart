import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userName,  this.avatar});
  final String userName;
  final String? avatar; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Styles.green900,
        title: Text(userName,),
      ),
      body: Container(
        
      ),
    );
  }
}