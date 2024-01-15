import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../widgets/job_details_people_tile.dart';


class JobDetailsPepole extends StatelessWidget {
   JobDetailsPepole({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "UI/UX Designer",
        child: Text(
          'UI/UX Designer',
          style: TextStyle(
            color: AppTheme.blac,
            fontSize: 10.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.regular,

          ),
        )),
    DropdownMenuItem(value: "Front",
        child: Text(
          'Front',
          style: TextStyle(
            color: AppTheme.blac,
            fontSize: 10.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.regular,

          ),
        )),
  ];

  String selectedValue = "UI/UX Designer";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                '3 Employees For',
                style: TextStyle(
                  color: AppTheme.blac,
                  fontSize: 11.5.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.medium,

                ),
              ),
              subtitle: Text(
                'UI/UX Design',
                style: TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 10.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular,

                ),
              ),

              trailing:  SizedBox(
                width: 40.w,

                child: DropdownButtonFormField(
                  padding: EdgeInsets.zero,
                    icon:  Icon(Iconsax.arrow_down_14,color: AppTheme.blac,size: 14.sp,),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
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
              ),
            ),
            SizedBox(height: 3.h,),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=> JobDetailsPeopleTile(image:"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR", name: "Dimas Adi Saputro", job: "Senior UI/UX Designer at Twitter", yearsOfExp: "5 Years"),

                separatorBuilder: (context,index)=>const Divider(),
                itemCount: 5
            ),
          ],
        ),
      ),
    );
  }
}
