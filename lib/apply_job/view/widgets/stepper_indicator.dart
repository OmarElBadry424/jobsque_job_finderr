import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import 'dotted_line.dart';

class StepIndication extends StatefulWidget {
  final int index;
  final String text;
  final bool state, lineState;
  final double? raduis;

  const StepIndication(this.index, this.text, this.state,
      {super.key, this.lineState = true, this.raduis});

  @override
  State<StepIndication> createState() => _StepIndicationState();
}

class _StepIndicationState extends State<StepIndication> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                  width: widget.raduis?? 5.5.h,
                  height:widget.raduis?? 5.5.h ,
                  decoration: ShapeDecoration(
                    color: widget.state ? AppTheme.midblu : Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(

                          color: widget.state
                              ? AppTheme.midblu
                              : AppTheme.lightgreyyy),
                    ),
                  ),
                  child: Center(
                    child: widget.state
                        ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                        : Text(
                      widget.index.toString(),
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        color: AppTheme.lightgreyyy,
                        fontSize: 13.5.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeightManager.medium,

                      ),
                    ),
                  )),
              SizedBox(height: 1.h,),
              SizedBox(
                //width: 19.w, //here 25.w
                child: Text(
                  widget.text,
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,

                  style: TextStyle(

                    color: widget.state
                        ? AppTheme.midblu
                        : AppTheme.blac,
                    fontSize: 10.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular,

                  ),
                ),
              ),
            ]),
        Row(

          children: [
            Visibility(
                visible: widget.lineState,
                child: Row(
                  children: [
                    SizedBox(width: 2.w,),
                    DottedLine(

                      dashColor: widget.state
                          ? AppTheme.midblu
                          : AppTheme.whitii,
                      totalWidth: 9.w,
                      dashWidth: 1.w,
                      dashHeight: 0.15.h,
                    ),
                    //SizedBox(width: 3.w,)
                  ],
                )
            ),
          ],
        ),
      ],
    );
  }
}

