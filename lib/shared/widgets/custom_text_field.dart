import 'package:flutter/material.dart';

import '../utils/app_utils.dart';


class CustomTextField extends StatelessWidget {
  bool isDark = false;

  final String? hint, lable;
  final TextEditingController controller;
  Color? textColor;
  final TextInputType textInputType;
  final Function()? onTap, onEditingComplete;
  final Function(String? v)? onChange, onFieldSubmitted;
  final bool obscureText, readOnly, autofocus, validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines, maxLength;
  final double radius;
  final TextAlign? textAlign;
  final Color? borderColor, fillColor;
  final Color? labelColor;
  final bool border;
  final double fontSize;
  final double? hintSize;
  final String? initialValue;
  final FocusNode? focusNode;
  final double? height;
  final double? cursorHeight;

  CustomTextField(
      {super.key,
        required this.controller,
        this.onFieldSubmitted,
        this.hint,
        this.lable,
        required this.textInputType,
        this.obscureText = false,
        this.prefixIcon,
        this.suffixIcon,
        this.onTap,
        this.onChange,
        this.onEditingComplete,
        this.focusNode,
        this.maxLines,
        this.textAlign,
        this.readOnly = false,
        this.autofocus = false,
        this.radius = 35,
        this.maxLength,
        this.validation = false,
        this.borderColor,
        this.fillColor,
        this.border = true,
        this.fontSize = 14,
        this.hintSize,
        this.labelColor = Colors.black,
        this.initialValue,
        this.height,
        this.cursorHeight, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15,color: textColor,fontFamily: 'Poppins'),
      cursorHeight: cursorHeight ?? 22,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      onTap: onTap,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // maxLength: maxLength,
      /* textAlign: textAlign != null
          ? textAlign!
          : AppUtil.rtlDirection(context)
          ? TextAlign.right
          : TextAlign.left,

       */
      onChanged: onChange,
      validator: validation
          ? (v) {
        if (v!.isEmpty) {
          return "Field is required";
        } else if(v=='0') {
          return 'Invalid value';
        }else {
          return null;
        }
      }
          : null,
      autofocus: autofocus,
      maxLines: maxLines ?? 1,
      cursorColor:  Colors.grey,
      cursorWidth: 1.0,
      cursorRadius: const Radius.circular(30),
      decoration: InputDecoration(
        hintText: hint,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(
          color: Color(0xFFA5A5A9),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: .7,fontSize: 14,
        )
            .copyWith(color:  Colors.grey),
        errorMaxLines: 2,
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 16),
          child: suffixIcon,
        ),
        labelText: lable,
        labelStyle: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
        filled: true,
        fillColor: fillColor ?? (isDark ?  Colors.grey: Colors.white),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
          child: prefixIcon,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppUtil.responsiveWidth(context) / 30,  //25
            vertical: AppUtil.responsiveHeight(context) / 42   //16,
        ),
        border: border
            ? OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
              topRight: Radius.circular(radius)),
          borderSide: BorderSide(
            color: borderColor ?? Colors.grey,
          ),
        )
            : null,
        disabledBorder: border
            ? OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius)),
            borderSide: BorderSide(
                color: borderColor ?? Colors.grey))
            : null,
        enabledBorder: border
            ? OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius)),
            borderSide: BorderSide(
                color: borderColor ??  Colors.grey))
            : null,
        focusedBorder: border
            ? OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
                bottomRight: Radius.circular(radius)),
            borderSide: BorderSide(
                color: borderColor ??  Colors.grey))
            : null,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius)),
            borderSide: const BorderSide(color:  Colors.grey)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius)),
            borderSide: const BorderSide(color:  Colors.grey)),
        suffixIconColor: Colors.white,
        // suffixIconConstraints:
        // const BoxConstraints(maxHeight: 36, maxWidth: 36),
        // prefixIconConstraints:
        // const BoxConstraints(maxHeight: 36, maxWidth: 36),
      ),
    );
  }
}