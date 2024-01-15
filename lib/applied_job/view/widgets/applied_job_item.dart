import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../../apply_job/view/widgets/stepper_indicator.dart';
import '../../../home/job feature.dart';
import '../../../home/view_model/home_cubit.dart';
import '../../../saved_job/model/favourite_model.dart';
import '../../view_model/applied_job_cubit.dart';

class AppliedJobItem extends StatefulWidget {
    const AppliedJobItem({Key? key, required this.jobData}) : super(key: key);

  final JobData jobData;

  @override
  State<AppliedJobItem> createState() => _AppliedJobItemState();
}

class _AppliedJobItemState extends State<AppliedJobItem> {
   int currentStep = 2;
   late AppliedJobCubit cubit;
   @override
  void initState() {
    super.initState();
    cubit=AppliedJobCubit.get(context);
  }

   @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Image.network(widget.jobData.image!)),
          title: Text(
            widget.jobData.name!,
            style: TextStyle(
              color:AppTheme.blac,
              fontSize: 15.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          subtitle:  Row(
            children: [
              Text(
                widget.jobData.compName!,
                style: TextStyle(
                  color: AppTheme.medgrey,
                  fontSize: 10.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular
                ),
              ),
              Expanded(
                child: Text(
                  "• ${widget.jobData.location!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.medgrey,
                    fontSize: 10.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular
                  ),
                ),
              ),
            ],
          ),
          trailing: BlocConsumer<HomeCubit, HomeState>(
            //  listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              print('stated updated: $state');

            },
            builder: (context, state) {

              return IconButton(
                onPressed: () {
                  HomeCubit.get(context).handleFavourite( widget.jobData);
                },

                icon:
                HomeCubit.get(context).checkFavourite(widget.jobData.id!)?
                Transform.translate(
                    offset: Offset(1.5.h,0),
                    child: const Icon(Iconsax.archive_minus5, color: AppTheme.midblu,)):
                const Icon(Iconsax.archive_minus,),
              );



            },
          ),
          contentPadding: EdgeInsets.zero,

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            JobFeature(
              text: widget.jobData.jobTimeType!,
            ),
            SizedBox(width: 2.h,),
            JobFeature(
              text: widget.jobData.jobType!,
            ),

            const Spacer(),


            Column(
              children: [
                Text(
                  'Posted 2 days ago',
                 // textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppTheme.medgrey,
                    fontSize: 10.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular,

                  ),
                )
              ],
            )

          ],
        ),
        SizedBox(height: 1.5.h,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height*0.10,

          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide( color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepIndication(

                  1, "Bio Data", currentStep >= 0,
                  raduis: 4.h,
                ),
                StepIndication(
                  2, 'Type of work', currentStep >= 1,
                  raduis: 4.h,
                ),
                StepIndication(
                    3, 'Upload portfolio', currentStep >= 2,
                    lineState: false,
                raduis: 4.h,
                ),
              ]
          ),
        ),
      ],
    );
  }
}
