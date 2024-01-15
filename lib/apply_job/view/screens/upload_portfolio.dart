import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../view_model/job_cubit.dart';
import '../widgets/portfolio_item.dart';
import '../widgets/upload_file.dart';


class UploadPortfolio extends StatefulWidget {
  const UploadPortfolio({Key? key}) : super(key: key);

  @override
  State<UploadPortfolio> createState() => _UploadPortfolioState();
}

class _UploadPortfolioState extends State<UploadPortfolio> {
  late JobCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = JobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Portfolio',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 16.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            Text(
              'Fill in your bio data correctly',
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 11.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            SizedBox(height: 3.h,),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Upload CV',
                    style: TextStyle(
                      color: AppTheme.blac,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.medium,

                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: AppTheme.orang2,
                      fontSize: 13.5.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular,

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),

            const UploadFile(target: 'CV',),

            //SizedBox(height: 1.h),
            BlocBuilder<JobCubit, JobState>(
              builder: (context, state) {
                return BuildCondition(
                  condition: cubit.selectedCVFile != null,
                  builder: (context) =>
                      CustomPortfolioItem(text: cubit.selectedCVFile!
                          .path
                          .split('/')
                          .last, size: ((cubit.selectedCVFile!.lengthSync())/1024/1024).toStringAsFixed(2), selectedFile: cubit.selectedCVFile!,),
                  fallback: (context) => const SizedBox.shrink(),

                );
              },
            ),


            // ),

            SizedBox(height: 2.h,),


            Text(
              'Other File',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            SizedBox(height: 1.h,),
            const UploadFile(target: 'Other',),
            BlocBuilder<JobCubit, JobState>(
              builder: (context, state) {
                return BuildCondition(
                  condition: cubit.selectedOtherFile != null,
                  builder: (context) =>
                      CustomPortfolioItem(text: cubit.selectedOtherFile!
                          .path
                          .split('/')
                          .last, size: ((cubit.selectedOtherFile!.lengthSync())/1024/1024).toStringAsFixed(2),isImage: true, selectedFile: cubit.selectedOtherFile!,),
                  fallback: (context) => const SizedBox.shrink(),

                );
              },
            ),



            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
