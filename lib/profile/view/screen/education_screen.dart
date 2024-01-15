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
class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final formKey=GlobalKey<FormState>();
  TextEditingController universityController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController startYearController = TextEditingController();

  TextEditingController endYearController = TextEditingController();
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Education", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University *',
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'University must not be empty';
                          }
                          else{
                            return null;
                          }
                        },
                          controller: universityController,
                          hintText: "University",
                          obscureText: false),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Title',
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
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Title must not be empty';
                            }
                            else{
                              return null;
                            }
                          },
                          controller: titleController,
                          hintText: "Title",
                          obscureText: false),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Start Date',
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Start Date must not be empty';
                          }
                          else{
                            return null;
                          }
                        },
                        controller: startYearController,
                        hintText: "Start Year",
                        obscureText: false,
                        suffixIcon: const Icon(Iconsax.calendar_1),
                        suffixIconColor: AppTheme.blac,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2050));

                          String formattedDate =
                              DateFormat.yMMMM().format(pickedDate!);

                          startYearController.text =
                              formattedDate;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'End Year',
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'End Date must not be empty';
                          }
                          else{
                            return null;
                          }
                        },
                        controller: endYearController,
                        hintText: "End Date",
                        obscureText: false,
                        suffixIcon: const Icon(Iconsax.calendar_1),
                        suffixIconColor: AppTheme.blac,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2101));
                          String formattedDate =
                              DateFormat.yMMMM().format(pickedDate!);
                          endYearController.text =
                              formattedDate;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                           if (state is AddItemCompleteProfile){
                          showSuccessSnackBar(context: context, message: 'Education Updated Successfully');
                          Navigator.pop(context);
                           }
                        },
                        builder: (context, state) {
                          return DefaultButton(() {
                            if(formKey.currentState!.validate()){
                              cubit.addItem('Education');

                            }
                          }, "Save");
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
