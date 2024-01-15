import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../View/Widgets/Default Text.dart';
import '../View/Widgets/color.dart';
import '../apply_job/view/widgets/dotted_line.dart';
class StepCircle extends StatefulWidget {
  final int index;
  final String text;
  final bool state, lineState;
  final double? radius;

  const StepCircle(this.index, this.text, this.state,
      {super.key, this.lineState = true, this.radius});

  @override
  State<StepCircle> createState() => _StepCircleState();
}

class _StepCircleState extends State<StepCircle> {
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
                  width: widget.radius ?? 7.h,
                  height: widget.radius ?? 7.h,
                  decoration: ShapeDecoration(
                    color:
                    widget.state ? AppTheme.blac : AppTheme.white,
                    shape: OvalBorder(
                      side: BorderSide(
                          color: widget.state
                              ? AppTheme.blac
                              : AppTheme.blac),
                    ),
                  ),
                  child: Center(
                    child: widget.state
                        ? const Icon(
                      Icons.check,
                      color: AppTheme.white,
                    )
                        : DefaultText(
                      text: widget.index.toString(),
                      textAlign: TextAlign.center,
                      fontSize: 13.5.sp,
                      fontWeight: FontWeightManager.medium,
                      color: widget.state
                          ? AppTheme.blac
                          : AppTheme.blac,
                    ),
                  )),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                child: DefaultText(
                  text: widget.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10.sp,
                  fontWeight: FontWeightManager.regular,
                  color: widget.state ? AppTheme.blac : AppTheme.blac,
                ),
              ),
            ]),
        Row(
          children: [
            Visibility(
              visible: widget.lineState,
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  DottedLine(
                    dashColor: widget.state
                        ? AppTheme.blac
                        : AppTheme.blac,
                    totalWidth: 9.w,
                    dashWidth: 1.w,
                    dashHeight: 0.15.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
