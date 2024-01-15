import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../saved_job/model/favourite_model.dart';


class JobDetailsCompany extends StatelessWidget{
 final JobData jobData;
   const JobDetailsCompany({Key? key, required this.jobData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //height: 8.h,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppTheme.whitii2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: AppTheme.lightgreyyy,
                            fontSize: 10.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular

                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          jobData.compEmail!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.blac,
                            fontSize: 11.5.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.medium,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4.w,),
                Expanded(
                  child: Container(
                    //height: 8.h,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppTheme.whitii2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Website',
                          style: TextStyle(
                            color: AppTheme.lightgreyyy,
                            fontSize: 10.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular,

                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          jobData.compWebsite!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.blac,
                            fontSize: 11.5.sp,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.medium,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 3.h,),
            Text(
              'About Company',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            SizedBox(height: 2.h,),
            Text(
              jobData.aboutComp!,
              textAlign:TextAlign.justify ,
              style: TextStyle(

                color: AppTheme.lightgr,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,

              ),
            )
          ],
        ),
      ),
    );
  }
}
