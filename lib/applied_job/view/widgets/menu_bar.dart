import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
import '../../view_model/applied_job_cubit.dart';
class MenuBarAppliedJob extends StatefulWidget {
  final PageController pageController;
  const MenuBarAppliedJob({Key? key, required this.pageController}) : super(key: key);

  @override
  State<MenuBarAppliedJob> createState() => _MenuBarAppliedJobState();
}

class _MenuBarAppliedJobState extends State<MenuBarAppliedJob> {
  late AppliedJobCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=AppliedJobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppliedJobCubit, AppliedJobState>(
  builder: (context, state) {
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

                  widget.pageController.animateToPage(0, duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);

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
                  "Active",
                  style: (cubit.activeIndex == 0)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium)
                      :  TextStyle(
                    color: AppTheme.lightgre,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium

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
                  widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);


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
                  "Rejected",
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
                    fontWeight: FontWeightManager.medium

                  ),

                ),
              ),
            ),
          ),

        ],
      ),
    );
  },
);
  }
}
