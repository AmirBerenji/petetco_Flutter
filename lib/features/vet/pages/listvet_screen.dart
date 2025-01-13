import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';

class ListVetScreen extends StatefulWidget {
  const ListVetScreen({super.key});

  @override
  State<ListVetScreen> createState() => _ListVetScreenState();
}

class _ListVetScreenState extends State<ListVetScreen> {
  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        title: Text(
          "List of vet",
          style: Styles.headLineStyle3,
        ),
        backgroundColor: Styles.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppLayout.getHeight(10)),
        child: ListView(
          children: [Text("data")],
        ),
      ),
    );
  }
}
