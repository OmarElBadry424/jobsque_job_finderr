import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
class Default extends StatelessWidget {
  const Default({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Suggested Job',
          style: TextStyle(
            color: AppTheme.lightgre,
            fontSize: 15.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium,

          ),
        ),
        TextButton(onPressed: () {}, child: Text(
          'View all',
          style: TextStyle(
            color: AppTheme.midblu,
            fontSize: 11.5.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium,

          ),
        )),
      ],
    );

  }
}
