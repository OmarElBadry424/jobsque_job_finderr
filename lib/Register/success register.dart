import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/forgot_password/idicator.dart';
import 'package:jobsque/router/app_route.dart';

import 'package:sizer/sizer.dart';

import '../View/Widgets/color.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/auth/Success Account Ilustration.svg"),
            SizedBox(height: 2.h,),
            Text(
              'Your account has been set up!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 20.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'We have customized feeds according to your preferences',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 12.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            const Spacer(),
            DefaultButton(() {
              Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
            }, "Get Started"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36,
          child: Indicator(context)),
    );
  }
}
