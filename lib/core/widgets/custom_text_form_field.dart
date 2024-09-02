import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/app_style/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool? enabled;
  final bool? obscureText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final void Function()? onTap;
  final bool isUpperCase;
  final AutovalidateMode autovalidateMode;
  final InputBorder? errorBorder;
  final int? maxLines;
  final double? radius;
  final Color? colorBorder;
  final Color? color;
  final Color? fillColor;
  final TextStyle? hintStyle;

  const CustomTextFormField(
      {required this.controller,
      Key? key,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.obscureText = false,
      this.hintText,
      this.inputFormatters,
      this.textInputAction,
      this.isUpperCase = false,
      this.enabled,
      this.keyboardType,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.initialValue,
      this.onChanged,
      this.readOnly = false,
      this.onTap,
      this.errorBorder,
      this.maxLines,
      this.radius,
      this.color,
      this.colorBorder,
      this.fillColor,
      this.hintStyle,
      this.labelText,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: obscureText! ? 1 : maxLines,
      readOnly: readOnly!,
      onTap: onTap,
      initialValue: initialValue,
      controller: controller,
      enabled: enabled,
      obscuringCharacter: '*',
      obscureText: obscureText!,

      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onChanged: (String text) {
        if (isUpperCase) {
          if (text.isNotEmpty) {
            print("Text before modification: $text");
            if (text.length > 1) {
              text = text[0].toUpperCase() + text.substring(1);
            } else if (text.length == 1) {
              text = text.toUpperCase();
            }
            print("Text after modification: $text");
          }
          controller.value = controller.value.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }

        if (onChanged != null) {
          onChanged!(text);
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: AppStyle.lnterFont,
            fontSize: 16.sp,
            color: AppStyle.black,
            fontWeight: FontWeight.w500,
            height: 1.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12.r),
          borderSide: BorderSide(
            color: color ?? AppStyle.textFieldBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12.r),
          borderSide: BorderSide(
            color: AppStyle.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12.r),
          borderSide: BorderSide(
            color: colorBorder ?? color ?? AppStyle.textFieldBorder,
          ),
        ),
        errorBorder: errorBorder,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 1.h), // Adjust this value to increase height
        errorMaxLines: 3,
        hintStyle: hintStyle ??
            TextStyle(
              color: AppStyle.lightGrey,
              fontFamily: 'Inter',
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w400,
              height: 1.0,
              textBaseline: TextBaseline.alphabetic,
            ),
        hintText: hintText,
        fillColor: fillColor ?? AppStyle.white,
        errorStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppStyle.redErrorColor, height: 1),
      ),
    );
  }
}
