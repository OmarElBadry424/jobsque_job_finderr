import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'color.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool obscureText;
  final Color? errorColor;
  final AutovalidateMode? autoValidateMode;
  final String? errorText;

  const DefaultTextFormField({super.key,
    required this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.labelText,
    this.validator,
    this.onTap,
    this.prefixIconColor,
    this.suffixIconColor,
    required this.obscureText, this.errorColor, this.autoValidateMode, this.errorText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: AppTheme.lightgre,
        fontSize: 16.0,
      ),
      autovalidateMode: autoValidateMode,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,

      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,

        suffixIcon: suffixIcon,
        suffixIconColor:suffixIconColor ,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular,
          color: AppTheme.lightgreyyy,
        ),
        errorText: errorText,
        errorStyle:   TextStyle(
          color: errorColor,
          fontSize: 16,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular

        ),
        labelText:
        labelText,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.whitii,
          ),
        ),
        focusedBorder: const OutlineInputBorder(

          borderSide: BorderSide(color: AppTheme.midblu),
        ),
      ),
    );
  }


}
