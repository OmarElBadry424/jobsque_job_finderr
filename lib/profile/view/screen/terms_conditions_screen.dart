import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
import '../../../View/Widgets/default appbar.dart';
class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Terms & Conditions", context),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor',
                style: TextStyle(
                  color: AppTheme.blac,
                  fontSize: 16.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 11.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular

                ),
              ),
              SizedBox(height: 2.h,),
              Text(
                'Lorem ipsum dolor',
                style: TextStyle(
                  color: AppTheme.blac,
                  fontSize: 16.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 11.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular

                ),
              ),
              SizedBox(height: 1.h,),
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 144,
                padding:  EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                decoration: const BoxDecoration(color: AppTheme.whiti3),
                child: Text(
                  'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: TextStyle(
                    color: AppTheme.lightgre,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular

                  ),
                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 11.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
