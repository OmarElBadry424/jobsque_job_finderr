import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:sizer/sizer.dart';
import '../../../../Local/cache helper.dart';
import '../../../../Local/enum.dart';
import '../../../../View/Widgets/Default Font.dart';
import '../../../../View/Widgets/color.dart';
import '../../../../View/Widgets/snack bar.dart';
import '../../../view_model/profile_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();
  late ProfileCubit cubit;
  final formKey = GlobalKey<FormState>();
  final List<Color> errorColors = [
    AppTheme.lightgreyyy,
    AppTheme.orang2,
    AppTheme.greenn5
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cubit.errorText='';
    cubit.errorText2='';
    cubit.errorText3='';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Change password", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Enter your old password',
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 13.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return DefaultTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              cubit.changeThirdColorIndex(0);
                              return 'Please Enter Your old Password';
                            }
                            if (value !=
                                CashHelper.getString(
                                    key: MySharedKeys.password)) {
                              cubit.changeThirdColorIndex(1);
                              return 'Please Enter Your old Password';
                            }
                              cubit.changeThirdColorIndex(2);
                              cubit.errorText3 =
                                  'Please Enter Your old Password';
                              return null;

                          },
                          errorColor: errorColors[cubit.colorIndex2],
                          errorText: cubit.errorText3,
                          controller: oldPasswordController,
                          hintText: "Old Password",
                          prefixIcon: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
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
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.blac
                                  : AppTheme.lightgreyyy),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.obscure,
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Enter your new password',
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 13.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return DefaultTextFormField(
                          validator: (value) {
                            cubit.password = value!;
                            if (value.isEmpty) {
                              cubit.changeColorIndex(0);
                              return 'Password must be at least 8 characters';
                            }
                            if (value.length < 8) {
                              cubit.changeColorIndex(1);

                              return 'Password must be at least 8 characters';
                            }
                            cubit.changeColorIndex(2);
                            cubit.errorText =
                                'Password must be at least 8 characters';
                            return null;
                          },
                          errorColor: errorColors[cubit.colorIndex],
                          errorText: cubit.errorText,
                          controller: newPasswordController,
                          hintText: "new Password",
                          prefixIcon: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
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
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.blac
                                  : AppTheme.lightgreyyy),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.obscure,
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Confirm your new password',
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 13.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return DefaultTextFormField(
                          validator: (value) {
                            if (value != cubit.password) {
                              cubit.changeSecondColorIndex(1);
                              return 'Both password must match';
                            } else {
                              cubit.changeSecondColorIndex(2);
                              cubit.errorText2 = 'Both password must match';
                              return null;
                            }
                          },
                          errorColor: errorColors[cubit.colorIndex1],
                          errorText: cubit.errorText2,
                          controller: confirmNewPasswordController,
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
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
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.blac
                                  : AppTheme.lightgreyyy),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.obscure,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileSuccessfully) {
                      showSuccessSnackBar(context: context, message: 'Password Updated Successfully');

                      Navigator.pop(context);
                    }
                    else if(state is UpdateProfileError){
                      showErrorSnackBar(context: context, message: 'There is something went wrong.Try Again');

                    }
                  },
                  builder: (context, state) {
                    return BuildCondition(
                      condition: state is! UpdateProfileLoading,
                      builder: (context) => DefaultButton(() {
                        if (formKey.currentState!.validate()) {
                          cubit.updateProfileNameAndPassword(
                              name: cubit.profile[0].name!,
                              password: newPasswordController.text);
                        }
                      }, "Save"),
                      fallback: (context) => const CircularProgressIndicator(),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
