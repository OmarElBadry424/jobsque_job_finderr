import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:sizer/sizer.dart';

import '../../../../View/Widgets/Default Font.dart';
import '../../../../View/Widgets/color.dart';
import '../../../../router/app_route.dart';

class TwoStepVerification2 extends StatelessWidget {
   TwoStepVerification2({Key? key}) : super(key: key);


    List<DropdownMenuItem<String>> menuItems = [
       DropdownMenuItem(value: "Telephone number (SMS)",
          child: Text(
            'Telephone number (SMS)',
            style: TextStyle(
              color: AppTheme.blac,
              fontSize: 11.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium

            ),
          )),
      DropdownMenuItem(value: "Authenticator App",
          child: Text(
            'Authenticator App',
            style: TextStyle(
              color: AppTheme.blac,
              fontSize: 11.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,

            ),
          )),
    ];

  String selectedValue = "Telephone number (SMS)";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h,),
            Text(
              'Select a verification method',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,

              ),
            ),
            SizedBox(height: 1.h,),
            DropdownButtonFormField(
              icon: const Icon(Iconsax.arrow_down_14,color: AppTheme.blac,),
                decoration: InputDecoration(
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
                value: selectedValue,
                onChanged: (String? newValue) {

                    selectedValue = newValue!;

                },
                items: menuItems),
            SizedBox(height: 2.h,),
            Text(
              'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
              style: TextStyle(

                color: AppTheme.lightgre,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            const Spacer(),
            DefaultButton(() {
              Navigator.pushNamed(context, AppRoute.twoStepVerification3);
            }, "Next"),

          ],
        ),
      ),
    );
  }
}
