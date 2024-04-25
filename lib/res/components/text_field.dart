import 'package:flutter/material.dart';

import '../color.dart';

class UKTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmitValue;
  final FormFieldValidator formFieldValidator;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final String hint;
  final bool obscureText, enable, autoFocus, filled;
  final Color? filledColor;

  const UKTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.onFieldSubmitValue,
      required this.formFieldValidator,
      required this.keyboardType,
      required this.hint,
      required this.obscureText,
      this.enable = true,
      this.filledColor,
      this.autoFocus = false,
      required this.validator,
      this.filled = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitValue,
      validator: validator,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.titleMedium,
      obscureText: obscureText,
      enabled: enable,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: filledColor,
        filled: filled,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: AppColors.primaryTextTextColor.withOpacity(0.8)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.alertColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
        ),
      ),
    );
  }
}
