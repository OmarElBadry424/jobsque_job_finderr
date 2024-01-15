import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../View/Widgets/color.dart';

class JobFeature extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  const JobFeature({super.key,
    required this.text,
    this.color=AppTheme.halfwitmov,
    this.textColor=
        AppTheme.midblu
    , this.onTap
  });

  @override
  State<JobFeature> createState() => _JobFeatureState();
}

class _JobFeatureState extends State<JobFeature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 3.5.h,
      decoration: ShapeDecoration(
        color:  widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 10.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.regular

          ),
        ),
      ),
    );
  }
}
