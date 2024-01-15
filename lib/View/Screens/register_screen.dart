import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:jobsque/View/Widgets/media%20button.dart';

import 'package:sizer/sizer.dart';
import '../../Register/register_cubit.dart';
import '../Widgets/line.dart';
import '../../router/app_route.dart';
import '../Widgets/color.dart';
import '../Widgets/snack bar.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterCubit cubit;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final List<Color> errorColors = [
    AppTheme.lightgreyyy,
    AppTheme.orang2,
    AppTheme.greenn5
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RegisterSuccessState) {
          showSuccessSnackBar(context: context, message: 'Registered Successfully');

          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.registerWorkScreen, (route) => false);
        }
        else if (state is RegisterErrorState) {
          showErrorSnackBar(context: context, message: 'There is something went wrong.Try Again');

        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.6.h),
              child: SvgPicture.asset("assets/images/auth/Logo (1).svg"),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 28,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Please create an account to find your dream job',
                      style: TextStyle(
                        color: AppTheme.lightgre,
                        fontSize: 16,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  DefaultTextFormField(
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
                  SizedBox(
                    height: 1.5.h,
                  ),
                  DefaultTextFormField(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    hintText: "Email",
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
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Iconsax.sms),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? AppTheme.blac
                        : AppTheme.whitii),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),

                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return DefaultTextFormField(
                        autoValidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          if (value!.isEmpty) {
                            cubit.changeColorIndex(0) ;
                            return 'Password must be at least 8 characters';
                          }
                          if (value.length < 8) {
                            cubit.changeColorIndex(1) ;

                            return 'Password must be at least 8 characters';
                          }

                          cubit.changeColorIndex(2);
                          cubit.errorText =
                          'Password must be at least 8 characters';
                          return null;
                        },
                        errorColor: errorColors[cubit.colorIndex],
                        errorText: cubit.errorText,
                        controller: passwordController,
                        hintText: "Password",
                        prefixIcon: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                                (states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.blac
                                : AppTheme.whitii),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeIcon();
                          },
                          icon: cubit.obscure
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                                (states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.blac
                                : AppTheme.lightgreyyy),
                        keyboardType: TextInputType.number,
                        obscureText: cubit.obscure,
                      );
                    },
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: AppTheme.lightgreyyy,
                            fontSize: 14,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.medium
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoute.loginScreen, (route) => false);
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
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultButton(() {
                    if (formKey.currentState!.validate()) {
                      cubit.userRegister(
                          name: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  }, "Create account"),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return Visibility(
                          visible: state is RegisterLoadingState,
                          child: Center(
                            child: Column(
                              children: [
                                const CircularProgressIndicator(
                                  color: AppTheme.midblu,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ));
                    },
                  ),

                  Row(
                    children: [
                      Expanded(child: line()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: const Text(
                          'Or Sign up With Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.lightgre,
                            fontSize: 14,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular
                          ),
                        ),
                      ),
                      Expanded(child: line()),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MediaButton(
                            "assets/images/icons/google.png", () {}, "Google"),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                          child: MediaButton(
                              "assets/images/icons/Facebook.png",
                                  () {},
                              "Facebook")),
                    ],
                  ),
                  // Center(
                  //   child: Column(
                  //     children: [
                  //       homeIndicator(context)
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
