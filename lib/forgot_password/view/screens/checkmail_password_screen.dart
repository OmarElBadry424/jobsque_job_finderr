import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/forgot_password/idicator.dart';

import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../router/app_route.dart';

class CheckMailForgotPasswordScreen extends StatelessWidget {
  const CheckMailForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/auth/Email Ilustration.svg"),
            SizedBox(height: 2.h,),
            Text(
              'Check your Email',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 20.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'We have sent a reset password to your email address',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 12.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,

              ),
            ),
            const Spacer(),
            DefaultButton(() {
              Navigator.pushNamed(context, AppRoute.createNewPasswordScreen);
            }, "Open email app"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36,
          child: Indicator(context)),
    );
  }
}
