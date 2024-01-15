import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../../../../View/Widgets/Default Font.dart';
import '../../../../View/Widgets/color.dart';


class TwoStepVerification4 extends StatelessWidget {
   TwoStepVerification4({Key? key}) : super(key: key);
  OtpFieldController otpController = OtpFieldController();

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
              'Enter the 6 digit code',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            SizedBox(height: 1.h,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Please confirm your account by entering the authorization code sen to ',
                    style: TextStyle(
                      color: AppTheme.lightgre,
                      fontSize: 11.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular

                    ),
                  ),
                  TextSpan(
                    text: '****-****-7234',
                    style: TextStyle(
                      color: AppTheme.blac,
                      fontSize: 11.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            OTPTextField(
            controller: otpController,
            length: 6,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 45,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 8,
            style: TextStyle(
              color: const Color(0xFF222741),
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium

            ),
            onChanged: (pin) {
              print("Changed: " + pin);
            },
            onCompleted: (pin) {
              print("Completed: " + pin);
            }),
            SizedBox(height: 2.h,),
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    onPressed: (){}, child: Text("Resend Code",
                style: TextStyle(
                  color: AppTheme.lightgreyyy,
                  fontSize: 13.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
                )),
                SizedBox(width: 1.w,),
                Text("42s",
                style: TextStyle(
                  color: AppTheme.midblu,
                  fontSize: 13.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
                ),
              ],
            ),
            const Spacer(),
            DefaultButton(() { }, "Verify"),



          ],
        ),
      ),

    );
  }
}
