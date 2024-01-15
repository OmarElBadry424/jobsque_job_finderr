import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../router/app_route.dart';

class Defaultss extends StatelessWidget {
  const Defaultss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent Job',
          style: TextStyle(
            color: AppTheme.lightgre,
            fontSize: 15.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium

          ),
        ),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, AppRoute.locationRegisterScreen);

        }, child: Text(
          'View all',
          style: TextStyle(
            color: AppTheme.midblu,
            fontSize: 11.5.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium

          ),
        )),
      ],
    );

  }
}
