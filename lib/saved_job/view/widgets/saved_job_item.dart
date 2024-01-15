
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../../home/view_model/home_cubit.dart';
import '../../../router/app_route.dart';
import '../../../View/Widgets/slide transition.dart';
import '../../model/favourite_model.dart';
import '../../view_model/favourite_cubit.dart';
import 'bottom sheet item.dart';
import 'bottom sheets.dart';

class SavedJobItem extends StatefulWidget {

  final SaveData saved;

  const SavedJobItem( {super.key, required this.saved});

  @override
  State<SavedJobItem> createState() => _SavedJobItemState();
}

class _SavedJobItemState extends State<SavedJobItem> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              Image.network(widget.saved.image!, width: 11.w, height: 5.h),
          title: Text(
            widget.saved.jobs!.name!,
            style: TextStyle(
              color: AppTheme.lightgre,
              fontSize: 15.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                widget.saved.jobs!.compName!,
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 10.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular
                ),
              ),
              Expanded(
                child: Text(
                  "• ${widget.saved.jobs!.location!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.lightgre,
                    fontSize: 10.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular
                  ),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            color: AppTheme.lightgre,
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) =>
                    SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0, 0.2), end: Offset.zero,
                      child:   CustomBottomSheet(
                        items: [
                          BottomSheetItem(
                            'Apply Job',
                            actionIcon: Iconsax.directbox_notif,
                            onTap: (){
                              Navigator.pushNamed(context, AppRoute.jobDetailsScreen,arguments:
                              widget.saved.jobs
                              );
                            },
                          ),
                          BottomSheetItem('Share via...', actionIcon: Iconsax.export,
                            onTap: () async{
                              await FavouriteCubit.get(context).shareImageFromApi(
                                  imageUrl: widget.saved.image!,
                                  text:widget.saved.jobs!.jobDescription!,
                                  subject:widget.saved.jobs!.name!
                              );


                            },
                          ),
                          BottomSheetItem('Cancel save',
                            actionIcon: Iconsax.archive_minus,
                            onTap: (){
                              cubit.RemoveSaved(widget.saved.id.toString());
                            },
                          ),
                        ],
                      ),),

              );
            },
            icon: const Icon(
              Iconsax.more,
              size: 24.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
             'Posted 2 days ago',
              style: TextStyle(
                color: AppTheme.medgrey,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular
              ),
            ),
            Spacer(),
            Row(
              children: [
                const Icon(
                  Iconsax.clock,
                  size: 12,
                  color: AppTheme.greenn3,
                ),
                const SizedBox(width: 6.0),
                Text(
                 'Be an early applicant',
                  style: TextStyle(
                    color: AppTheme.medgrey,
                    fontSize: 10.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
