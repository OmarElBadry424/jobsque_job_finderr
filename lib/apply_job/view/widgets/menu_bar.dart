import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../view_model/job_cubit.dart';
class CustomMenuBar extends StatefulWidget {
  final PageController pageController;
  const CustomMenuBar({Key? key, required this.pageController}) : super(key: key);

  @override
  State<CustomMenuBar> createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  late JobCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 6.h,
      decoration: const BoxDecoration(
        color: AppTheme.whiti3,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {

                  cubit.changeIndex(0);
                 widget.pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (cubit.activeIndex == 0)
                    ? const BoxDecoration(
                  color: AppTheme.darkblu,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Description",
                  style: (cubit.activeIndex == 0)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium,)
                      :  TextStyle(
                    color: AppTheme.lightgre,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium,

                  ),

                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {

                cubit.changeIndex(1);

                widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);


              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (cubit.activeIndex == 1)
                    ? const BoxDecoration(
                  color: AppTheme.darkblu,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Company",
                  style: (cubit.activeIndex == 1)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium)
                      :  TextStyle(
                    color: AppTheme.lightgre,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium,

                  ),

                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {

                cubit.changeIndex(2);

                widget.pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (cubit.activeIndex == 2)
                    ? const BoxDecoration(
                  color: AppTheme.darkblu,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Pepole",
                  style: (cubit.activeIndex == 2)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium)
                      :  TextStyle(
                    color: AppTheme.lightgre,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium,

                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



