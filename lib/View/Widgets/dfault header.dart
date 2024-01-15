import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

class DefaultHeader extends StatelessWidget {
  final String header;
  final bool isCentered;
  const DefaultHeader(this.header, {super.key, this.isCentered = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const ShapeDecoration(
        color: AppTheme.whiti3,
        shape: RoundedRectangleBorder(
          side: BorderSide( color: AppTheme.whitii2),
        ),
      ),
      child: Row(
        mainAxisAlignment:
        isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Text(header,
              style:  TextStyle(
                color: AppTheme.lightgre,
                fontSize: 12.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ))
        ],
      ),
    );
  }
}