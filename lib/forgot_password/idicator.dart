import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../View/Widgets/color.dart';

Indicator(context){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0.5.h),
    child: Container(
      width: MediaQuery.of(context).size.width*0.36,
      height: 5,
      decoration: ShapeDecoration(
        color: AppTheme.darkgrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}