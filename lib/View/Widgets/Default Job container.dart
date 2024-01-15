import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import 'color.dart';
import '../../Register/register_cubit.dart';

class DefaultJobContainer extends StatefulWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;


  const DefaultJobContainer({super.key,
    required this.text,
    required this.icon, this.onTap ,
  });


  @override
  State<DefaultJobContainer> createState() => _DefaultJobContainerState();
}

class _DefaultJobContainerState extends State<DefaultJobContainer> {
  late RegisterCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=RegisterCubit.get(context);

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(cubit.interestedWork.contains(widget.text)){
          cubit.deleteItem(widget.text);
        }
        else{
          cubit.addItem(widget.text);
        }
        print(cubit.interestedWork);

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        decoration: ShapeDecoration(
          color: cubit.interestedWork.contains(widget.text)?  AppTheme.midblu.withOpacity(0.3):AppTheme.whitii.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5, color: cubit.interestedWork.contains(widget.text)? AppTheme.midblu:const Color(0xFFFAFAFA)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: cubit.interestedWork.contains(widget.text)? Colors.white:AppTheme.whitii.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color:cubit.interestedWork.contains(widget.text)? AppTheme.midblu:AppTheme.whitii),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Icon(widget.icon,color:cubit.interestedWork.contains(widget.text)? AppTheme.midblu:const Color(0xFF292D32) ,),
            ),
            SizedBox(height: 1.h,),
            Flexible(
              child: Text(
                widget.text,
                style:  const TextStyle(
                  color: AppTheme.blac,
                  fontSize: 16,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
