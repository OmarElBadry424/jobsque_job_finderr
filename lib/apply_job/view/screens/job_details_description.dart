import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../saved_job/model/favourite_model.dart';

class JobDetailsDescription extends StatelessWidget {
  final JobData jobData;
  const JobDetailsDescription({Key? key, required this.jobData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Description',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              jobData.jobDescription!,
              textAlign:TextAlign.justify ,

              style: TextStyle(
                color: AppTheme.lightgr,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,

              ),
            ),
            SizedBox(height: 2.h,),
            Text(
              'Skill Required',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              jobData.jobSkill!,
              textAlign:TextAlign.justify ,

              style: TextStyle(
                color: AppTheme.lightgr,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            )
          ],
        ),
      ),
    );
  }
}
