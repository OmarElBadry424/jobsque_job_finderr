import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../../home/job feature.dart';
import '../../../home/view_model/home_cubit.dart';
import '../../../router/app_route.dart';
import '../../../saved_job/model/favourite_model.dart';
import '../../../View/Widgets/slide transition.dart';
import '../../view_model/job_cubit.dart';
import '../widgets/menu_bar.dart';
import 'job_details_company.dart';
import 'job_details_description.dart';
import 'job_details_pepole.dart';

class JobDetails extends StatefulWidget {
  final JobData jobData;

  const JobDetails({Key? key, required this.jobData}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  late HomeCubit homeCubit;
  late JobCubit cubit;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = JobCubit.get(context);
    homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return DefaultAppBar("Job detail", context, actions: [
              IconButton(onPressed: (){
                homeCubit.handleFavourite(widget.jobData);
              }, icon:
              homeCubit.checkFavourite(widget.jobData.id)?
              Transform.translate(
                offset: Offset(1.5.h,0),
                child: const Icon(
                  Iconsax.archive_minus5,
                  color: AppTheme.midblu,
                ),
              ):
              const Icon(
                Iconsax.archive_minus,
              )
              )

            ]);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 65.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.jobData.image!,
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      widget.jobData.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 16.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium
                      ),
                    ),
                    Text(
                      '${widget.jobData.compName} • ${widget.jobData.location} ',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.medgrey,
                        fontSize: 10.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        JobFeature(
                          text: widget.jobData.jobTimeType!,
                        ),
                        JobFeature(
                          text: widget.jobData.jobType!,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    return CustomMenuBar(
                      pageController: pageController,
                    );
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0.2, 0), end: Offset.zero,
                      child: JobDetailsDescription(
                        jobData: widget.jobData,
                      ),),
                    SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0.2, 0), end: Offset.zero,
                      child:  JobDetailsCompany(
                        jobData: widget.jobData,
                      ),),

                    SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0.2, 0), end: Offset.zero,
                      child: JobDetailsPepole(),),

                  ], // onPageChanged: (index) {
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: DefaultButton(() {
                  Navigator.pushNamed(context, AppRoute.applyJobScreen,
                      arguments: widget.jobData);
                }, "Apply now")),
          )
        ],
      ),
    );
  }
}
