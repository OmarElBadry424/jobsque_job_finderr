import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
class EducationListTile extends StatelessWidget {

  final String image;
  final String title;
  final String bachelor;
  final String date;


   const EducationListTile({Key? key, required this.image, required this.title, required this.bachelor, required this.date}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(image, width: 11.w, height: 5.h),
          title: Text(
            title,
            style:  TextStyle(
              color: AppTheme.blac,
              fontSize: 13.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bachelor,
                      style:  TextStyle(
                        color: AppTheme.lightgre,
                        fontSize: 11.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular
                      )),
                  Text(date,
                      style:  TextStyle(
                        color: AppTheme.lightgre,
                        fontSize: 11.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.regular
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(
                      Iconsax.edit_2,
                      size: 24.0,
                      color: AppTheme.midblu,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              )
            ],
          ),
          contentPadding: EdgeInsets.zero,
        ),

      ],
    );
  }
}
