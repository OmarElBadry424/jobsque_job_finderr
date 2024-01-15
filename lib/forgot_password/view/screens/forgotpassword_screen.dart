import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';

import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../login/Login cubit.dart';
import '../../../router/app_route.dart';
import '../../idicator.dart';

class ForgotPasswordScreen extends StatefulWidget {
   const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController= TextEditingController();

  late LoginCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit= LoginCubit.get(context);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset("assets/images/auth/Logo.svg")
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 24.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 13.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            SizedBox(height: 4.h,),
            DefaultTextFormField(
                controller: emailController,
                prefixIcon: Icon(Iconsax.sms),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? AppTheme.blac
                    : AppTheme.whitii),
                hintText: "Enter your email",
                obscureText: false),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'You remember your password',
                    style: TextStyle(
                      color: AppTheme.lightgreyyy,
                      fontSize: 14,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.medium,

                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
                },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: AppTheme.midblu,
                        fontSize: 14,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium
                      ),
                    )),

              ],
            ),
            SizedBox(height: 2.h,),
            DefaultButton(() {
              Navigator.pushNamed(context, AppRoute.checkEmailForgetPasswordScreen);
            }, "Request password reset")



          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36,
          child: Indicator(context)),
    );
  }
}
