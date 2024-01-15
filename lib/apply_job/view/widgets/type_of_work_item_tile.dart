import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../view_model/job_cubit.dart';
class TypeofWorkTile extends StatefulWidget {
  final String title;
  final String subtitle;
    bool isSelected;
  final int value;

   TypeofWorkTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,  this.isSelected=false,

  });

  @override
  State<TypeofWorkTile> createState() => _TypeofWorkTileState();
}

class _TypeofWorkTileState extends State<TypeofWorkTile> {


  late JobCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
  builder: (context, state) {
    return Column(children: [
      InkWell(
        onTap: () {
          // Check the isSelected variable of the other tiles.
          for (TypeofWorkTile tile in cubit.WorkType) {
            if (tile != this && tile.isSelected) {
              tile.isSelected = false;
            }
          }


           widget.isSelected=true;
            cubit.selectChoice(widget.value);


        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: ShapeDecoration(
            color:widget.isSelected ? const Color(0xFFE0EAFF) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color:widget.isSelected ? AppTheme.midblu : AppTheme.whitii,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,

            title: Text(
              widget.title,
              style:  TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,

              ),
            ),
            subtitle: Text(
              widget.subtitle,
              style:  TextStyle(
                color: AppTheme.lightgre,
                fontSize: 10.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular,

              ),
            ),
            trailing: Radio(
              value: widget.value,
              groupValue: cubit.selectedChoice,
              activeColor: AppTheme.midblu,
              splashRadius: 25,
              onChanged: (value) {
              //  cubit.selectChoice(value);
              },
            ),
          ),
        ),
      ),
      SizedBox(height: 2.h,)
    ]);
  },
);
  }
}