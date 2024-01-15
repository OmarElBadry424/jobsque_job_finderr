

import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../View/Widgets/color.dart';
import '../Model/onBoarding model.dart';

class BoardingItem extends StatelessWidget {
  final OnboardingModel model;
  const BoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(model.image,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),

          SizedBox(height: 0.5.h,),
              Padding(
                padding:  const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: model.title

            ),

          SizedBox(height: 0.5.h,),
             Padding(
              padding:  const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Center(
                child: Text(model.body, style:  TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeightManager.regular,
                  fontFamily:FontConstants.fontFamily,
                  color: AppTheme.lightgre,
                ),
                  //maxLines: 2,

                ),
              ),
            ),

        ],
      ),
    );
  }
}




