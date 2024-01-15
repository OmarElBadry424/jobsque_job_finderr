import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import 'color.dart';
import '../../Register/register_cubit.dart';

class SelectTypeJobMenu extends StatefulWidget {
  const SelectTypeJobMenu({Key? key}) : super(key: key);

  @override
  State<SelectTypeJobMenu> createState() => _SelectTypeJobMenuState();
}

class _SelectTypeJobMenuState extends State<SelectTypeJobMenu> {
  late RegisterCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=RegisterCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RegisterCubit, RegisterState>(
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
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  onTap: () {
                    cubit.changeIndex(0);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    alignment: Alignment.center,
                    decoration: (cubit.activeIndex == 0)
                        ? const BoxDecoration(
                      color: AppTheme.darkblu,
                      borderRadius:
                      BorderRadius.all(Radius.circular(100.0)),
                    )
                        : null,
                    child: Text(
                      "Work From Office",
                      style: (cubit.activeIndex == 0)
                          ? TextStyle(
                        color: Colors.white,
                        fontSize: 11.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium
                      )
                          : TextStyle(
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
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    alignment: Alignment.center,
                    decoration: (cubit.activeIndex == 1)
                        ? const BoxDecoration(
                      color: AppTheme.darkblu,
                      borderRadius:
                      BorderRadius.all(Radius.circular(100.0)),
                    )
                        : null,
                    child: Text(
                      "Remote Work",
                      style: (cubit.activeIndex == 1)
                          ? TextStyle(
                        color: Colors.white,
                        fontSize: 11.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium
                      )
                          : TextStyle(
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


