import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
class JobDetailsPeopleTile extends StatelessWidget {
   JobDetailsPeopleTile({Key? key, required this.image, required this.name, required this.job, required this.yearsOfExp}) : super(key: key);
  final String image;
  final String name;
  final String job;
  final String yearsOfExp;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image, width: 5.h, height: 5.h),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style:  TextStyle(
              color: AppTheme.blac,
              fontSize: 11.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          Text(
            'Work during',
            //textAlign: TextAlign.right,
            style: TextStyle(
              color: AppTheme.lightgre,
              fontSize: 10.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.regular,

            ),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(job,
              style:  TextStyle(
                color: AppTheme.lightgre,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,
              )),
          Text(
            yearsOfExp,
            //textAlign: TextAlign.right,
            style: TextStyle(
              color:AppTheme.midblu,
              fontSize: 10.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,

            ),
          ),

        ],
      ),

      contentPadding: EdgeInsets.zero,

    );
  }
}
