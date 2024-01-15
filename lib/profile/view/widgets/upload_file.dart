import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/color.dart';
import '../../view_model/profile_cubit.dart';
class UploadFile extends StatefulWidget {
  final String target;
  const UploadFile({Key? key, required this.target}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=ProfileCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        cubit.pickFile(widget.target);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8.0),
        dashPattern: const [8, 5],
        color: AppTheme.midblu ,
        child: Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppTheme.halfwitmov.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 17.w,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppTheme.halfwitmov,
                  shape: BoxShape.circle,
                ),
                child:  Center(
                  child: Icon(
                    Iconsax.document_upload5,
                    color: AppTheme.midblu,
                    size: 27.sp,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                widget.target=='CV'? 'Upload your CV':
                'Upload your other file',
                style: TextStyle(
                  color: AppTheme.blac,
                  fontSize: 15.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium

                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Max. file size 1 MB',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 10.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular
                ),
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 5.5.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: AppTheme.halfwitmov,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: AppTheme.midblu),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.export_1,
                        color: AppTheme.midblu,
                        size: 17.sp,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        'Add file',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppTheme.midblu,
                          fontSize: 11.5.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.medium,

                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
