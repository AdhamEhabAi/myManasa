import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';

class CustomDropdownField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final List<String> items;
  final Icon? prefixIcon;
  final Function(String?)? onChanged;

  const CustomDropdownField({
    required this.hintText,
    required this.labelText,
    required this.items,
    this.prefixIcon,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.primaryColor,
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        hint: Text(hintText),
      ),
    );
  }
}