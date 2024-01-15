import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/dfault%20header.dart';
import '../../../shimmer/shimmer_applied_list_view.dart';
import '../../view_model/applied_job_cubit.dart';
import '../widgets/applied_job_item.dart';
import 'applied_not_found.dart';

class AppliedJobActiveScreen extends StatefulWidget {
  const AppliedJobActiveScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobActiveScreen> createState() => _AppliedJobActiveScreenState();
}

class _AppliedJobActiveScreenState extends State<AppliedJobActiveScreen> {
  late AppliedJobCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = AppliedJobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AppliedJobCubit, AppliedJobState>(
            builder: (context, state) {
              return DefaultHeader("${cubit.appliedJobsData.length} Jobs");
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<AppliedJobCubit, AppliedJobState>(
              builder: (context, state) {
                if (state is AppliedJobEmpty) {
                  return const AppliedScreenNotFound();
                }
                if (cubit.appliedJobsData.isNotEmpty) {
                  return   ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => AppliedJobItem(
                        jobData: cubit.appliedJobsData[index],
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: cubit.appliedJobsData.length);
                }
                else {
                  return const ShimmerAppliedListView();

                }




              },
            ),
          )
        ],
      ),
    );
  }
}
