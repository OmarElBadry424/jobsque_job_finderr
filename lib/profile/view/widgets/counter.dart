import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
class CustomCounter extends StatelessWidget {
  final String counterName;
  final int counter;
  const CustomCounter(
      {super.key, required this.counterName, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            counterName,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: AppTheme.lightgre,
              fontSize: 11.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium

            ),
          ),
          Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: AppTheme.blac,
              fontSize: 13.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium

            ),
          ),
        ],
      ),
    );
  }
}
