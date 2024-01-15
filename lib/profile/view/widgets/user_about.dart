import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../../router/app_route.dart';
import '../../view_model/profile_cubit.dart';
class UserAbout extends StatefulWidget {
  const UserAbout({super.key});

  @override
  State<UserAbout> createState() => _UserAboutState();
}

class _UserAboutState extends State<UserAbout> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About',
              style: TextStyle(
                color: AppTheme.lightgre,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium

              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.editDetailsScreen);
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: AppTheme.midblu,
                    fontSize: 11.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium

                  ),
                ))
          ],
        ),
        SizedBox(height: 0.5.h),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(cubit.profileDetails.isNotEmpty){
              return Text(
                cubit.profileDetails[0].bio!,
                style: TextStyle(

                  color: AppTheme.lightgre,
                  fontSize: 11.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular

                ),
              );
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }

          },
        ),
      ],
    );
  }
}
