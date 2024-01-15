import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/View/Widgets/Default%20TextFormField.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
import '../../../View/Widgets/snack bar.dart';
import '../../../View/Widgets/default appbar.dart';
import '../../view_model/profile_cubit.dart';
class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController positionController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController startYearController = TextEditingController();
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "Full time",
        child: Text(
          'Full time',
          style: TextStyle(
            color: AppTheme.blac,
            fontSize: 11.5.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium
          ),
        )),
    DropdownMenuItem(
        value: "Part time",
        child: Text(
          'Part time',
          style: TextStyle(
            color: AppTheme.blac,
            fontSize: 11.5.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.medium
          ),
        )),
  ];

  String selectedValue = "Full time";
  final formKey = GlobalKey<FormState>();
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Experience", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 484,
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                  bottom: 16,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppTheme.whitii),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Position *',
                        style: TextStyle(
                          color: AppTheme.lightgreyyy,
                          fontSize: 13.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      DefaultTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Position must not be empty';
                            } else {
                              return null;
                            }
                          },
                          controller: positionController,
                          hintText: "Position",
                          obscureText: false),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Type of work',
                        style: TextStyle(
                          color: AppTheme.lightgreyyy,
                          fontSize: 13.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      DropdownButtonFormField(
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: AppTheme.blac,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppTheme.whitii,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.midblu),
                            ),
                          ),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            selectedValue = newValue!;
                          },
                          items: menuItems),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Company name *',
                        style: TextStyle(
                          color: AppTheme.lightgreyyy,
                          fontSize: 13.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      DefaultTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Company must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: companyNameController,
                        hintText: "Company Name",
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: AppTheme.lightgreyyy,
                          fontSize: 13.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      DefaultTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Location must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: locationController,
                        hintText: "Location",
                        obscureText: false,
                        prefixIcon: const Icon(Iconsax.location),
                        prefixIconColor: AppTheme.blac,
                      ),
                      Row(
                        children: [
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              return Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: cubit.isChecked,
                                  activeColor: AppTheme.midblu,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side: const BorderSide(
                                    color: AppTheme.lightgreyyy,
                                  ),
                                  onChanged: (newValue) {
                                    cubit.changeCheck(newValue);
                                  });
                            },
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'I am currently working in this role',
                              style: TextStyle(
                                color: AppTheme.blac,
                                fontSize: 11.5.sp,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.medium
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Start Year *',
                        style: TextStyle(
                          color: AppTheme.lightgreyyy,
                          fontSize: 13.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      DefaultTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Start Year must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: startYearController,
                        hintText: "Start Year",
                        obscureText: false,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2050));

                          String formattedDate =
                              DateFormat.yMMMM().format(pickedDate!);
                          startYearController.text = formattedDate;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is AddExperienceSuccessState) {
                            showSuccessSnackBar(
                                context: context,
                                message: 'Experience Updated Successfully');
                            Navigator.pop(context);
                          }
                          else if (state is AddExperienceErrorState) {
                            showErrorSnackBar(
                                context: context,
                                message: 'There something wrong, Try Again');

                          }
                        },
                        builder: (context, state) {
                          if (state is! AddExperienceLoadingState) {
                            return DefaultButton(() {
                              if (formKey.currentState!.validate()) {
                                cubit.addExperience(
                                    position: positionController.text,
                                    typeWork: selectedValue,
                                    companyName: companyNameController.text,
                                    location: locationController.text,
                                    startDate: startYearController.text);
                              }
                            }, "Save");
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
