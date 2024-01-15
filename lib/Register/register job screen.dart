import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Job%20container.dart';
import 'package:jobsque/Register/register_cubit.dart';
import 'package:sizer/sizer.dart';

import '../View/Widgets/Default Font.dart';
import '../View/Widgets/color.dart';
import '../router/app_route.dart';

class RegisterJobScreen extends StatefulWidget {
  const RegisterJobScreen({Key? key}) : super(key: key);

  @override
  State<RegisterJobScreen> createState() => _RegisterJobScreenState();
}

class _RegisterJobScreenState extends State<RegisterJobScreen> {
  List Jobs_selection = [
    ["UI/UX Designer", Iconsax.bezier],

    ["Illustrator Designer", Iconsax.pen_tool],
    ["Developer", Iconsax.code],
    ["Management", Iconsax.graph],
    ["Information Technology", Iconsax.monitor_mobbile],
    ["Research and Analytics", Iconsax.cloud_add],


  ];
  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What type of work are you interested in?',
                      maxLines: 2,
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 20.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium,

                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                      'Tell us what you’re interested in so we can customise the app for your needs.',
                      style: TextStyle(
                        color: const Color(0xFF737379),
                        fontSize: 13.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular,
                      ),
                    ),
                    SizedBox(height: 3.6.h,),
                    BlocBuilder<RegisterCubit,RegisterState>(
                        builder: (context,state){
                          return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.1,
                                crossAxisCount: 2,
                                crossAxisSpacing: 1.4.w,
                                mainAxisSpacing: 2.h,
                              ),
                              itemCount: Jobs_selection.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return DefaultJobContainer(
                                    text: Jobs_selection[index][0], icon: Jobs_selection[index][1]);
                              });
                        }

                    ),

                    SizedBox(height: 10.h,),

                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultButton(() {
                    Navigator.pushNamedAndRemoveUntil(context, AppRoute.locationRegisterScreen, (route) => false);
                  }, "Next"))
            ],
          ),
        ),
      ),

    );

  }
}
