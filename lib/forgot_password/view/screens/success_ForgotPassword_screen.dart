import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';

import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../idicator.dart';

class SuccessForgotPasswordScreen extends StatelessWidget {
  const SuccessForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/auth/Password Succesfully Ilustration.svg"),
            SizedBox(height: 2.h,),
            Text(
              'Password changed successfully!',
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
              'Your password has been changed successfully, we will let you know if there are more problems with your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 12.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,

              ),
            ),
            const Spacer(),
            DefaultButton(() { }, "Open email app"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36,
          child: Indicator(context)),
    );
  }
}
