import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/default%20search.dart';
import 'package:jobsque/home/view/screens/texts.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../profile/view_model/profile_cubit.dart';
import '../../../router/app_route.dart';
import '../../../shimmer/shimmer_container_effect.dart';
import '../../view_model/home_cubit.dart';
import '../widgets/recent_job_item.dart';
import 'default 2.dart';
import 'job status items.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  late HomeCubit cubit;
  late ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
    profileCubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 0, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if(profileCubit.profile.isNotEmpty){
                    return Text(
                      '${profileCubit.profile[0].name}👋',
                      style: TextStyle(
                        color: AppTheme.lightgre,
                        fontSize: 20.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium,

                      ),
                    );
                  }
                  else{
                    return ShimmerContainerEffect(
                      height: 1.2.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                    );
                  }

                },
              ),
              SizedBox(height: 0.8.h,),
              Text(
                'Create a better future for yourself here',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 11.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium,

                ),
              ),
              SizedBox(height: 0.8.h,),

            ],
          ),
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            child: Container(
                width: 48,
                height: 48,
                //  padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppTheme.whitii),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Center(
                  child: IconButton(onPressed: () {

                    Navigator.pushNamed(context, AppRoute.notificationScreen);
                  },
                      icon: const Icon(Iconsax.notification,
                      color: AppTheme.lightgr,)
                  ),
                )
            ),
          ),


        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultSearch(
                  keyboardType: TextInputType.none,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.searchScreen);
                  },
                  controller: searchController, hintText: "Search...."),
              SizedBox(height: 2.h,),
              const JobStatusItem(title: 'Twitter',
                subTitle: 'Waiting to be selected by the twitter team',
                isAccepted: false,),
              SizedBox(height: 2.h,),
              Default(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(cubit.suggestJobsData.isNotEmpty){
                    return    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          RecentJobItem(
                            jobData: cubit.suggestJobsData[index],
                          ),
                      separatorBuilder: (context,
                          index) => const Divider(),
                      itemCount: cubit.suggestJobsData.length,

                    );

                  }
                  else{
                    return ShimmerContainerEffect(
                      height: 1.2.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                    );
                  }

                },
              ),

              Defaultss(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(cubit.recentJobsData.isNotEmpty){
                    return    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          RecentJobItem(
                            jobData: cubit.recentJobsData[index],
                          ),
                      separatorBuilder: (context,
                          index) => const Divider(),
                      itemCount: cubit.recentJobsData.length,

                    );

                  }
                  else{
                    return ShimmerContainerEffect(
                      height: 1.2.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                    );
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
