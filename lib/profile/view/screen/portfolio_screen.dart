import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../Local/cache helper.dart';
import '../../../Local/enum.dart';
import '../../../View/Widgets/color.dart';
import '../../../View/Widgets/snack bar.dart';
import '../../../View/Widgets/default appbar.dart';
import '../../../View/Widgets/item portfolio.dart';
import '../../view_model/profile_cubit.dart';
import '../widgets/upload_file.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('Portfolio', context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Add portfolio here',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 16.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
              ),
              SizedBox(height: 2.h),
              const UploadFile(target: 'CV',),

              //SizedBox(height: 1.h),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return BuildCondition(
                    condition: cubit.selectedCVFile != null,
                    builder: (context) =>
                        CustomPortfolioItem(text: cubit.selectedCVFile!
                            .path
                            .split('/')
                            .last,
                          size: ((cubit.selectedCVFile!.lengthSync()) / 1024 /
                              1024).toStringAsFixed(2),
                          selectedFile: cubit.selectedCVFile!,),
                    fallback: (context) => const SizedBox.shrink(),

                  );
                },
              ),
              SizedBox(height: 1.h),

              SizedBox(height: 2.h),
              ],
            ),),
            Align(
              alignment: Alignment.bottomCenter,
              child:  BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is AddCVSuccessState) {
                    showSuccessSnackBar(
                        context: context,
                        message: 'Portfolio Updated Successfully');
                    Navigator.pop(context);
                  }
                  else if (state is AddCVErrorState) {
                    showErrorSnackBar(
                        context: context,
                        message: 'There something wrong, Try Again');

                  }
                },
                builder: (context, state) {
                  return DefaultButton(() {
                    if(cubit.selectedCVFile!=null){
                      cubit.addPortofolio();

                    }
                     if(CashHelper.getString(key: MySharedKeys.completeProfile)==''){
                      cubit.addItem('Portfolio');

                    }

                  }, 'Save');
                },
              ),

            )
          ],
        ),
      )
    ,
    );
  }
}