import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
class CustomBottomSheet extends StatelessWidget {
  final List<Widget> items;
  final bool isTitled;
  final String? text;
  const CustomBottomSheet({super.key, required this.items,  this.isTitled=false,  this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: const EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(

        children: [
          Container(
            height: 6.0,
            width: MediaQuery.of(context).size.width*0.2,
            // padding: const EdgeInsets.all(14),
            decoration: ShapeDecoration(
              color: AppTheme.darkgrey,
              shape: RoundedRectangleBorder(
                side: const BorderSide( color: AppTheme.darkgrey),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          isTitled? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text!,
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 15.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
              ),
            ],
          ):SizedBox(),
          Column(
            children: items,
          )

        ],
      ),
    );
  }
}