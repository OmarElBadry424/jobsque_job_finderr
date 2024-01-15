import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
class AppliedJobRejectedScreen extends StatelessWidget {
  const AppliedJobRejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/home/Data.svg"),
            SizedBox(height: 3.h,),
            Text(
              'No applications were rejected',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 20.sp,
                fontFamily:FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'If there is an application that is rejected by the company it will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 13.5.sp,
                fontFamily:  FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            )
          ],
        ),
      ),
    );
  }
}
