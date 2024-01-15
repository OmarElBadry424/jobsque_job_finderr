import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../View/Widgets/Default Font.dart';
import '../../View/Widgets/color.dart';


class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/home/Notification Ilustration.svg'),
           SizedBox(height: 2.h),
           Text(
            'No new notifications yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.blac,
              fontSize: 20.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,

            ),
          ),
           Text(
            'You will receive a notification if there is something on your account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.lightgre,
              fontSize: 13.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.regular,

            ),
          ),
        ],
      ),
    );
  }
}
