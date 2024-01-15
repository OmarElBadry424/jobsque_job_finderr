import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/theme/theme_cubit.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';
import '../Screens/default screeeen.dart';
AppBar DefaultAppBar(String title,context,{List<Widget>? actions,Color? backgroundColor,bool? leading=true}) {
  return AppBar(
    elevation: 0,
    leading: leading!?  IconButton(onPressed:
        () { Navigator.pop(context); },
      icon: const Icon(Iconsax.arrow_left),
    color: AppTheme.lightgre,) : const SizedBox.shrink()  ,
    actions: [
      // Switch(value: ThemeCubit.get(context).isDarkTheme, onChanged: (value){
      //   ThemeCubit.get(context).changeAppTheme();
      // }),

      DefaultIcon()

      // IconButton(
      //     icon: const Icon(
      //       // icon: cubit.obscure?(Iconsax.eye_slash) : const Icon(Iconsax.eye),
      //
      //     ),
      //     onPressed: () {
      //       ThemeCubit.get(context).isDarkTheme;
      //       ThemeCubit.get(context).changeAppTheme();
      //     })


    ],
    backgroundColor: backgroundColor ,
    title: Text(title,
        style:  TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeightManager.medium,
            fontFamily: FontConstants.fontFamily,
            color: AppTheme.lightgre
        )),
    centerTitle: true,
  );
}