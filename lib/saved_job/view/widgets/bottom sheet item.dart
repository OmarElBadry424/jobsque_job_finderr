import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
class BottomSheetItem extends StatelessWidget {
  final String actionName;
  final IconData? actionIcon;
  final bool hasIcon;
  final void Function()? onTap;
  const BottomSheetItem(this.actionName, {super.key,this.actionIcon,  this.hasIcon=true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),

          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide( color: AppTheme.whitii),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: hasIcon? Icon(
              actionIcon,
              size: 20.0,
            ): null,
            title: Text(
              actionName,
              style:  TextStyle(
                color: AppTheme.lightgre,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            trailing: const Icon(
              Iconsax.arrow_right_3,
              size: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}