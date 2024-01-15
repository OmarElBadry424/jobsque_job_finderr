import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
class DefaultPhoneFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Color? prefixIconColor;
  final void Function(CountryCode)? onChanged;

  const DefaultPhoneFiled({super.key,
    required this.controller,

    this.validator,
    this.onTap,
    this.prefixIconColor, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: validator,
      onTap: onTap,
      obscureText: false,
      decoration: InputDecoration(
        prefixIcon: CountryCodePicker(

          showDropDownButton: true,
          onChanged: onChanged,
          initialSelection: 'US',
          //favorite: const ['+02','EG'],
        ),
        prefixIconColor: prefixIconColor,

        hintText: "Phone Number",
        hintStyle: const TextStyle(
          fontSize: 14,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular,
          color: AppTheme.lightgreyyy,
        ),
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