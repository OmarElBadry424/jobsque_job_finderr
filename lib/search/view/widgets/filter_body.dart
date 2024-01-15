import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../view_model/search_cubit.dart';
import '../../view_model/search_state.dart';
import 'job_feature_filter.dart';

class FilterBody extends StatefulWidget {
  const FilterBody({Key? key}) : super(key: key);

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  TextEditingController locationController = TextEditingController();

  late SearchCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=SearchCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.70,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Iconsax.arrow_left),
                    ),
                    Text(
                      'Set Filter',
                      style: TextStyle(
                        color: AppTheme.blac,
                        fontSize: 16.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium
                      ),
                    ),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () {
                              locationController.text = '';
                              cubit
                                  .changeSelectedSalary('');
                              cubit.jobTypeFilter.clear();
                            },
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                color: AppTheme.midblu,
                                fontSize: 13.5.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.medium
                              ),
                            ));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    color: AppTheme.blac,
                    fontSize: 13.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultTextFormField(
                    prefixIcon:
                    const Icon(Iconsax.location),
                    prefixIconColor:
                    MaterialStateColor.resolveWith(
                            (states) => states.contains(
                            MaterialState.focused)
                            ? AppTheme.blac
                            : AppTheme.whitii),
                    controller: locationController,
                    hintText: "Location",
                    obscureText: false),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Salary',
                  style: TextStyle(
                    color: AppTheme.blac,
                    fontSize: 13.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                        hint: const Text('Select Salary'),
                        icon: const Icon(
                          Iconsax.arrow_down_14,
                          color: AppTheme.blac,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                              Iconsax.dollar_circle),
                          prefixIconColor:
                          AppTheme.blac,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppTheme.whitii,
                            ),
                          ),
                          focusedBorder:
                          const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppTheme.midblu),
                          ),
                        ),
                        value: cubit.selectedValue,
                        onChanged: (String? newValue) {
                          cubit.changeSelectedSalary(
                              newValue);
                        },
                        items: cubit.menuItems);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Job Type',
                  style: TextStyle(
                    color: AppTheme.blac,
                    fontSize: 13.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    const JobFeatureFilter(
                      text: "FullTime",
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Remote"),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Contract")
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    const JobFeatureFilter(
                        text: "Part Time"),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Onsite"),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(
                        text: "Internship")
                  ],
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {
                  if (state is SearchLoaded ||
                      state is SearchEmpty) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return BuildCondition(
                    condition: state is! SearchLoading,
                    builder: (context) =>
                        DefaultButton(() {
                          cubit.fetchDataWithFilters(
                              location:
                              locationController.text);
                        }, "Show Result"),
                    fallback: (context) =>
                    const CircularProgressIndicator(),
                  );
                },
              ))
        ],
      ),
    );
  }
}
