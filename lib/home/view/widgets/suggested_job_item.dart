import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../../router/app_route.dart';
import '../../../saved_job/model/favourite_model.dart';
import '../../job feature.dart';

class SuggestedJobItem extends StatelessWidget {
  final JobData jobData;

  const SuggestedJobItem({super.key,
   required this.jobData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: ShapeDecoration(
        color: AppTheme.darkblu,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Image.network(jobData.image!)),
            title: Text(
              jobData.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color:Colors.white,
                fontSize: 15.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.medium,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  jobData.compName!,
                  style: TextStyle(
                    color: AppTheme.lightgreyyy,
                    fontSize: 10.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular

                  ),
                ),
                Expanded(
                  child: Text(
                    "• ${jobData.location!}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.lightgreyyy,
                      fontSize: 10.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeightManager.regular

                    ),
                  ),
                ),
              ],
            ),


            trailing: IconButton(onPressed: () {  },
              icon: const Icon(Iconsax.archive_minus,color: Colors.white,),

            ),
            contentPadding: EdgeInsets.zero,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              JobFeature(text: jobData.jobTimeType!,color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white,),
              SizedBox(width: 2.h,),
              JobFeature(text: jobData.jobType!,color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white),
            ],
          ),
          SizedBox(height: 1.5.h,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: '\$${jobData.salary!}',
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontFamily: FontConstants.fontFamily,
                       fontWeight: FontWeightManager.medium

                     ),
                   ),
                   TextSpan(
                     text: '/Month',
                     style: TextStyle(
                       color: Colors.white.withOpacity(0.5),
                       fontSize: 12,
                       fontFamily: FontConstants.fontFamily,
                       fontWeight: FontWeightManager.medium,

                     ),
                   ),
                 ],
               ),
             ),
             ElevatedButton(onPressed: (){
               Navigator.pushNamed(context, AppRoute.jobDetailsScreen,arguments: jobData);

             },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppTheme.midblu,
                   padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(1000), // <-- Radius
                   ),
                 ),
                 child: Text("Apply now",
                   style:  TextStyle(
                     color: Colors.white,
                     fontSize: 10.sp,
                     fontFamily: FontConstants.fontFamily,
                     fontWeight: FontWeightManager.medium,
                   ),
                 ),)
           ],
         )

        ],
      ),
    );
  }


}
