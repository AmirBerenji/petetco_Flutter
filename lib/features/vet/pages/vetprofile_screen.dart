import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/models/vet_model.dart';
import 'package:petetco/commons/utils/app_style.dart';

class VetProfileScreen extends StatefulWidget {
  const VetProfileScreen({super.key, required this.vet});

  final Vet vet;

  @override
  State<VetProfileScreen> createState() => _VetProfileScreenState();
}

class _VetProfileScreenState extends State<VetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.network(
            widget.vet.cover,
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
          ),
          // Transparent AppBar
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Styles.grey900),
              onPressed: () {
                Navigator.of(context).pop(); // Back navigation
              },
            ),
          ),
          // Content Section
          Padding(
            padding:
                const EdgeInsets.only(top: 230), // Avoid overlapping AppBar
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styles.bgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.vet.name.toString(),
                          style: Styles.headLineStyleGreen2,
                        ),
                        const Gap(10),
                        Text(
                          widget.vet.description.toString(),
                          style: Styles.headLineStyle4,
                        ),
                        const Gap(10),
                        const Divider(),
                        Column(
                          children: widget.vet.branches!
                              .map((b) => Text(b.name!.toString()))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Styles.bgColor,
    );
  }
}
