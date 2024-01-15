import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
import '../../view_model/profile_cubit.dart';
class CompleteProfileTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isNotLast;
  final void Function()? onTap;

  const CompleteProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isNotLast = true, this.onTap,
  });

  @override
  State<CompleteProfileTile> createState() => _CompleteProfileTileState();
}

class _CompleteProfileTileState extends State<CompleteProfileTile> {
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=ProfileCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap:widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: ShapeDecoration(
            color: cubit.completeProfile.contains(widget.title) ? const Color(0xFFE0EAFF) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: cubit.completeProfile.contains(widget.title) ? Colors.blue : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding:  EdgeInsets.only(right: 1.h),
              child: Icon(

                Iconsax.tick_circle5,
                color: cubit.completeProfile.contains(widget.title) ? AppTheme.midblu : AppTheme.lightgreyyy,
                size: 28,
              ),
            ),
            title: Text(
              widget.title,
              style:  TextStyle(
                color: AppTheme.lightgre,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            subtitle: Text(
              widget.subtitle,
              style:  TextStyle(
                color: AppTheme.lightgre,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            trailing: const Icon(Iconsax.arrow_right_1),
          ),
        ),
      ),
      Visibility(
        visible: widget.isNotLast,
        child: SizedBox(
          height: 20,
          child: VerticalDivider(
            color: cubit.completeProfile.contains(widget.title) ? Colors.blue : AppTheme.whitii,
          ),
        ),
      ),
    ]);
  }
}