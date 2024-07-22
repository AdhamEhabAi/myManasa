import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.controller,
      this.validator,
      super.key,
      this.hintText,
      this.prefix,
      this.suffix,
      this.labelText,
      this.onChanged,
      this.obsecureText = false,
      this.textInputType, this.color = Colors.white, this.onTap,this.enabled = true, this.borderColor = Colors.white});
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final bool obsecureText;
  final TextEditingController? controller ;
  final TextInputType? textInputType;
  final Color color,borderColor;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     blurRadius: 7,
          //   ),
          // ],
        ),
        child: TextFormField(
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
          keyboardType: textInputType,
          controller: controller,
          obscureText: obsecureText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor,width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:borderColor,width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                  width: 2
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor,width: 2),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefix,
            prefixIconColor: AppColors.primaryColor,
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}
