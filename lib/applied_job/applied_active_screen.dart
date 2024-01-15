import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/applied_job/view_model/applied_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../View/Widgets/color.dart';
import '../home/view/widgets/recent_job_item.dart';
import '../home/view_model/home_cubit.dart';
import '../shimmer/shimmer_suggested_job.dart';
import 'circle.dart';
class AppliedActiveScreen extends StatefulWidget {
  const AppliedActiveScreen({Key? key}) : super(key: key);

  @override
  State<AppliedActiveScreen> createState() => _AppliedActiveScreenState();
}

class _AppliedActiveScreenState extends State<AppliedActiveScreen> {
  late AppliedJobCubit cubit;
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    cubit = AppliedJobCubit.get(context);
    homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.5.h,
            width: 90.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.medgrey),
            ),
            child: Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return homeCubit.recentJobsData.isNotEmpty
                        ? SizedBox(
                      height: 16.h,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 2.5),
                          itemCount: homeCubit.recentJobsData.length,
                          itemBuilder: (context, index) {
                            return RecentJobItem(
                              jobData:
                              homeCubit.recentJobsData[index],
                            );
                          }),
                    )
                        : const ShimmerSuggestedJob();
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 11.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppTheme.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StepCircle(1, "Bio Data", true),
                      StepCircle(2, 'Type of work', true),
                      StepCircle(3, 'Upload portfolio', true, lineState: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
