import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
class CustomSystemTile extends StatelessWidget {
  final String title;
  final bool withIcon;
  final IconData? icon;
  final void Function()? onTap;
  const CustomSystemTile(this.title,
      {this.icon, this.withIcon = true, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: withIcon
          ? Container(
        height: 5.h,
        width: 10.5.w,
        decoration: const BoxDecoration(
            color: AppTheme.halfwitmov, shape: BoxShape.circle),
        child: Center(child: Icon(icon,color: AppTheme.midblu,)),
      )
          : null,
      title: Text(
        title,
        style:  TextStyle(
          color: AppTheme.lightgre,
          fontSize: 13.5.sp,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular

        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon:  Icon(Iconsax.arrow_right_1, size: 13.5.sp,
        color: AppTheme.lightgre,),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
