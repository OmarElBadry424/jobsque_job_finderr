import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../View/Widgets/color.dart';
import '../Layout/layout state.dart';
import '../Layout/layout_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late LayoutCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LayoutCubit.get(context);
    cubit.changeIndex(0);
    cubit.getCompleteProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body:AnimatedSwitcher(duration: const

          Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);

            },
            child: cubit.screens[cubit.currentIndex],

          ) ,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            selectedItemColor: AppTheme.midblu,
            selectedLabelStyle: TextStyle(
              color: AppTheme.midblu,
              fontSize: 9.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,
            ),
            selectedIconTheme: const IconThemeData(

                color: AppTheme.midblu
            ),
            unselectedItemColor: AppTheme.lightgreyyy,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Iconsax.home,
                ),
                activeIcon: const Icon(
                  Iconsax.home_15,
                ),
                label: cubit.titles[0],
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.message,
                  ),
                  activeIcon: const Icon(
                    Iconsax.message5,
                  ),
                  label: cubit.titles[1]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.briefcase,
                  ),
                  activeIcon:  Padding(
                    padding: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                    child: const Icon(
                      Iconsax.briefcase5,
                    ),
                  ),
                  label: cubit.titles[2]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.archive_minus,
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                    child: const Icon(
                      Iconsax.archive_minus5,

                    ),
                  ),
                  label: cubit.titles[3]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.frame_1,
                  ),
                  activeIcon: const Icon(
                    Iconsax.frame5,
                  ),
                  label: cubit.titles[4]),
            ],
          ),
        );
      },
    );
  }
}
