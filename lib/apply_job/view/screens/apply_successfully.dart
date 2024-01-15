import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
import '../../../router/app_route.dart';


class ApplyJobSuccessfully extends StatelessWidget {
  const ApplyJobSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Apply Job", context,leading: false),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/home/Data Ilustration (1).svg"),
                  SizedBox(height: 3.h,),
                  Text(
                    'Your data has been successfully sent',
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
                    'You will get a message from our team, about the announcement of employee acceptance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.lightgre,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular,

                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: DefaultButton(() {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);

                }, "Back to home"))
          ],
        ),
      ),
    );
  }
}
