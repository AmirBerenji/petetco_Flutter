import 'package:flutter/material.dart';
import 'package:petetco/commons/models/vet_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';

class VetProfileScreen extends StatefulWidget {
  const VetProfileScreen({super.key, required this.e});

  final Vet e;

  @override
  State<VetProfileScreen> createState() => _VetProfileScreenState();
}

class _VetProfileScreenState extends State<VetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        title: Text(widget.e.name.toString()),
        backgroundColor: Styles.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppLayout.getHeight(10)),
        child: ListView(
          children: [
            Column(
              children: [Text(widget.e.name.toString())],
            )
          ],
        ),
      ),
    );
  }
}
