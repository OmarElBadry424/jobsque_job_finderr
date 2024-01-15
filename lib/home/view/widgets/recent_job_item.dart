import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../router/app_route.dart';
import '../../../saved_job/model/favourite_model.dart';
import '../../job feature.dart';
import '../../view_model/home_cubit.dart';

class RecentJobItem extends StatefulWidget {
  final JobData jobData;

  const RecentJobItem({
    super.key,
    required this.jobData,
  });

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.jobDetailsScreen,
                arguments: widget.jobData);
          },
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Image.network(widget.jobData.image!)),
          title: Text(
            widget.jobData.name!,
            style: TextStyle(
              color: AppTheme.lightgre,
              fontSize: 15.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                widget.jobData.compName!,
                style: TextStyle(
                  color: AppTheme.medgrey,
                  fontSize: 10.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular,
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
            listener: (context, state) {
            },
            builder: (context, state) {

                return IconButton(
                  onPressed: () {
                    cubit.handleFavourite( widget.jobData);
                  },

                  icon:
                        cubit.checkFavourite(widget.jobData.id!)?
                  Transform.translate(
                      offset: Offset(1.5.h,0),
                      child: const Icon(Iconsax.archive_minus5, color: AppTheme.midblu,)):
               const Icon(Iconsax.archive_minus,
               color: AppTheme.lightgre,),
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
            SizedBox(
              width: 2.h,
            ),
            JobFeature(
              text: widget.jobData.jobType!,
            ),
            const Spacer(),

            Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${widget.jobData.salary!}',
                        style: TextStyle(
                          color: AppTheme.greenn3,
                          fontSize: 13.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium
                        ),
                      ),
                      TextSpan(
                        text: '/Month',
                        style: TextStyle(
                          color: AppTheme.lightgre,
                          fontSize: 10.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
