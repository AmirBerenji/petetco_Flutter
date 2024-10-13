import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, 
                      this.onTap, 
                      required this.width, 
                      required this.height, 
                      this.color, 
                      required this.borderColor, 
                      required this.text });

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color;
  final Color borderColor;
  final Text text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1,color: borderColor )
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}