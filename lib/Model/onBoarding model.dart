import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../View/Widgets/color.dart';

class OnboardingModel {
  String image;
  Text title;
  String body;

  OnboardingModel(this.image, this.title, this.body);

  static List<OnboardingModel> boardingData=[
    OnboardingModel("assets/lottie/Animation - job.json",
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Find a job, and ", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.blac,
              )),
              TextSpan(text: "start building ", style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.midblu,
              )),
              TextSpan(text: " your career from now on", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.blac,
              )),
            ],
          ),
        ),

        "Explore over 25,924 available job roles and upgrade your operator now."),
    OnboardingModel("assets/lottie/Animation - job2.json",
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Hundreds of jobs are waiting for you to  ", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.blac,
              )),
              TextSpan(text: "join together ", style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.midblu,
              )),
            ],
          ),
        ),


        "Immediately join us and start applying for the job you are interested in."),

    OnboardingModel("assets/lottie/Animation - job3.json",
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Get the best ", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.blac,
              )),
              TextSpan(text: "choice for the job ", style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.midblu,
              )),
              TextSpan(text: "you've always dreamed of", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeightManager.medium,
                fontFamily:FontConstants.fontFamily,
                color: AppTheme.blac,
              )),
            ],
          ),
        ),

        "The better the skills you have, the greater the good job opportunities for you."),

  ];
}