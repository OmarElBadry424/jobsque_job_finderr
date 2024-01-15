import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../view_model/job_cubit.dart';


class TypeOfWorkScreen extends StatefulWidget {
  const TypeOfWorkScreen({super.key});

  @override
  State<TypeOfWorkScreen> createState() => _TypeOfWorkScreenState();
}

class _TypeOfWorkScreenState extends State<TypeOfWorkScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type Of Work',
            style: TextStyle(
              color:AppTheme.blac,
              fontSize: 16.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,

            ),
          ),
          Text(
            'Fill in your bio data correctly',
            style: TextStyle(
              color: AppTheme.lightgre,
              fontSize: 11.5.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.regular,

            ),
          ),
          SizedBox(height: 3.h,),

          Column(
            children: cubit.WorkType,
          ),

          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
