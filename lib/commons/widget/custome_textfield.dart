import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged,
      this.obscureText,
      this.textInputAction,
      this.onTap});

  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getScreenWidth() * 0.9,
      height: 55,
      decoration: BoxDecoration(
        color: Styles.bgColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(Styles.radiousSize)),
      ),
      child: TextFormField(
        onTap: onTap,
        textInputAction: textInputAction,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: Styles.headLineStyle3.copyWith(color: Styles.grey900),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixIconColor: Styles.grey700,
            hintStyle: hintStyle,
            labelText: hintText,
            errorBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Styles.radiousSize)),
                borderSide: BorderSide(color: Styles.errorRed, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Styles.radiousSize)),
                borderSide: BorderSide(color: Styles.grey600, width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Styles.radiousSize)),
                borderSide: BorderSide(color: Styles.errorRed, width: 1)),
            disabledBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Styles.radiousSize)),
                borderSide: BorderSide(color: Styles.grey400, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Styles.radiousSize)),
                borderSide: BorderSide(color: Styles.grey500, width: 1))),
      ),
    );
  }
}
