import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:sizer/sizer.dart';

import '../../../../View/Widgets/Default Font.dart';
import '../../../../View/Widgets/color.dart';
import '../../../../View/Widgets/phone textform field.dart';
import '../../../../router/app_route.dart';



class TwoStepVerification3 extends StatelessWidget {
   TwoStepVerification3({Key? key}) : super(key: key);
   TextEditingController phoneController=TextEditingController(text: '0100-666-7234');
   TextEditingController passwordController=TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  DefaultAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add phone number',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            SizedBox(height: 0.5.h,),
            Text(
              'We will send a verification code to this number',
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            SizedBox(height: 2.h,),
            CustomPhoneTextFormField(controller: phoneController,),
            SizedBox(height: 2.h,),
            Text(
              'Enter your password',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            SizedBox(height: 1.h,),
            DefaultTextFormField(
              controller: passwordController,
              hintText: "Password",
              prefixIcon:  const Icon(Iconsax.lock),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.blac
                  : AppTheme.whitii),
              suffixIcon: IconButton(onPressed: () {  },
                icon: const Icon(Iconsax.eye_slash),
              ),
              suffixIconColor:MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.blac
                  : AppTheme.lightgreyyy),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const Spacer(),
            DefaultButton(() {
              Navigator.pushNamed(context, AppRoute.twoStepVerification4);
            }, "Send Code"),

          ],
        ),
      ),
    );
  }
}
