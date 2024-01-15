import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
class JobStatusItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isAccepted;

  const JobStatusItem({Key? key, required this.title, required this.subTitle, required this.isAccepted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppTheme.halfwitmov,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFF6690FF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: SvgPicture.asset("assets/images/home/twitter.svg")) ,
        title: Text(
          title,
          style: TextStyle(
            color: const Color(0xFF222741),
            fontSize: 13.5.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium,

          ),
        ),
        subtitle:Text(
          'Waiting to be selected by the twitter team',
          style: TextStyle(
            color: AppTheme.medgrey,
            fontSize: 10.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.regular,

          ),
        ) ,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            color:isAccepted? AppTheme.greenn7:AppTheme.whitmov,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            isAccepted?
            'Accepted': 'Submited'  ,
            style: TextStyle(
              color: isAccepted? AppTheme.greenn2:AppTheme.semiblu,
              fontSize: 10.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.regular,

            ),
          ),
        ),
      ),
    );
  }
}
