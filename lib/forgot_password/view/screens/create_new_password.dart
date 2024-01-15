import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../idicator.dart';
import '../../view_model/forget_password_cubit.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late ForgetPasswordCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit= ForgetPasswordCubit.get(context);

  }
  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordCheckController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final List<Color> errorColors = [AppTheme.lightgreyyy, AppTheme.orang2, AppTheme.greenn5];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        // TODO: implement listener
        //if state is sucess navigate to next screen
      },
      builder: (context, state) {
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    //autovalidateMode: AutovalidateMode.onUserInteraction,

                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create new password',
                          style: TextStyle(
                            color: AppTheme.blac,
                            fontSize: 24.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.medium,

                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Text(
                          'Set your new password so you can login and access Jobsque',
                          style: TextStyle(
                            color: AppTheme.lightgre,
                            fontSize: 13.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular,

                          ),
                        ),
                        SizedBox(height: 4.h,),
                        DefaultTextFormField(
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value){
                              cubit.password=value!;
                              if (value!.isEmpty) {
                                cubit.colorIndex=0;
                                return 'Password must be at least 8 characters';
                              }
                              if (value.length < 8) {
                                cubit.colorIndex=1;

                                return 'Password must be at least 8 characters';
                              }
                              cubit.colorIndex=2;
                              cubit.errorText2='Password must be at least 8 characters';
                              return null;

                            },
                            errorColor: errorColors[cubit.colorIndex],
                            errorText: cubit.errorText2,
                            controller: passwordController,
                            prefixIcon: const Icon(Iconsax.lock),
                            prefixIconColor: MaterialStateColor.resolveWith((
                                states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.blac
                                : AppTheme.whitii),
                            hintText: "Enter your new password",
                            suffixIcon: IconButton(onPressed: (){
                              cubit.changeIcon();
                            },
                              icon:cubit.obscure? const Icon(Iconsax.eye_slash): const Icon(Iconsax.eye) ,),
                            suffixIconColor: MaterialStateColor.resolveWith((
                                states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.blac
                                : AppTheme.whitii),
                            obscureText: cubit.obscure),
                        SizedBox(height: 1.h,),

                        SizedBox(height: 2.h,),

                        DefaultTextFormField(
                            autoValidateMode: AutovalidateMode.onUserInteraction,

                            validator: (value) {
                              // since we stored the password value in the state, we can access the
                              // variable here and compare the value
                              if (value != cubit.password) {
                                cubit.colorIndex1=0;
                                return 'Both password must match';
                              }
                              else{
                                cubit.colorIndex1=2;
                                cubit.errorText='Both password must match';
                                return null ;
                              }
                            },
                            errorColor: errorColors[cubit.colorIndex1],
                            errorText: cubit.errorText,


                            controller: passwordCheckController,
                            prefixIcon: const Icon(Iconsax.lock),
                            prefixIconColor: MaterialStateColor.resolveWith((
                                states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.blac
                                : AppTheme.whitii),
                            hintText: "Enter your new password",
                            suffixIcon: IconButton(onPressed: (){
                              cubit.changeIcon();
                            },
                              icon:cubit.obscure? const Icon(Iconsax.eye_slash): const Icon(Iconsax.eye) ,),
                            suffixIconColor: MaterialStateColor.resolveWith((
                                states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.blac
                                : AppTheme.whitii),
                            obscureText: cubit.obscure),
                        SizedBox(height: 1.h,),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: DefaultButton(() {
                      if(formKey.currentState!.validate()){
                        print("doneeeeee");
                      }
                    }, "Reset password"))

              ],
            ),
          ),
          bottomNavigationBar: FractionallySizedBox(
              widthFactor: 0.36,
              child: Indicator(context)),
        );
      },
    );
  }
}
