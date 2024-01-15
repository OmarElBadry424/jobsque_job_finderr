import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../../View/Widgets/constants.dart';
import '../widgets/default phone field.dart';


class BioDataScreen extends StatelessWidget {
   BioDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Biodata',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 16.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            Text(
              'Fill in your bio data correctly',
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            SizedBox(height: 3.h,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Full Name',
                    style: TextStyle(
                      color: AppTheme.blac,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular,

                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: AppTheme.orang2,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
              DefaultTextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return'cannot be empty';
                }
                else{
                  return null;
                }
              },
              controller: usernameController,
              hintText: "Username",
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Iconsax.user),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.blac
                  : AppTheme.whitii),
              obscureText: false,

            ),
            SizedBox(height: 2.h,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Email',
                    style: TextStyle(
                      color: AppTheme.blac,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular

                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: AppTheme.orang2,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            DefaultTextFormField(
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'email must not be empty';
                }
                final bool isValid = EmailValidator.validate(value);
                if (!isValid) {
                  return "please enter right email";
                }
                return null;
              },
              controller: emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Iconsax.sms),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.blac
                  : AppTheme.whitii),
              obscureText: false,

            ),
            SizedBox(height: 2.h,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'No.Headphone',
                    style: TextStyle(
                      color: AppTheme.blac,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular,

                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: AppTheme.orang2,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular,

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            DefaultPhoneFiled(
                validator: (value){
                  if(value!.isEmpty){
                    return'cannot be empty';
                  }
                  if (value.length < 10) {


                    return 'Phone must be 11 characters';
                  }

                  else{
                    return null;
                  }
                },
                controller: phoneController),
          ],
        ),
      ),
    );
  }
}