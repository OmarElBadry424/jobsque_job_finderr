import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:jobsque/View/Widgets/dfault%20header.dart';
import 'package:jobsque/saved_job/view/screens/saved_job_empty.dart';
import 'package:sizer/sizer.dart';
import '../../../home/view_model/home_cubit.dart';
import '../widgets/saved_job_item.dart';


class SavedJobScreen extends StatefulWidget {
  const SavedJobScreen({Key? key}) : super(key: key);

  @override
  State<SavedJobScreen> createState() => _SavedJobScreenState();
}

class _SavedJobScreenState extends State<SavedJobScreen> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('Saved', context,leading: false),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BuildCondition(
            condition:cubit.savedItems.isNotEmpty ,
            builder: (context) =>
                SingleChildScrollView(
                  child: Column(
                    children: [
                       DefaultHeader(
                        '${cubit.savedItems.length} Job Saved',
                        isCentered: true,
                      ),
                      SizedBox(height: 1.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ListView.separated(

                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.savedItems.length,
                          itemBuilder: (BuildContext context, int index) =>
                              SavedJobItem(saved: cubit.savedItems[index],),
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(indent: 24.0, endIndent: 24.0),
                        ),
                      ),
                    ],
                  ),
                ),
            fallback: (context) => const SavedJobEmptyScreen(),


          );
        },
      ),


    );
  }
}
