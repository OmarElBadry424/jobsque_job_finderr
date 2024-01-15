import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';

import 'package:sizer/sizer.dart';

import '../../../../View/Widgets/Default Font.dart';
import '../../../../View/Widgets/color.dart';
import '../../../../View/Widgets/phone textform field.dart';



class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);
  TextEditingController phoneController=TextEditingController(text: '0100-666-7234');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: DefaultAppBar("Phone Number", context),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main phone number',
              style: TextStyle(
                color: AppTheme.blac,
                fontSize: 13.5.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.regular

              ),
            ),
            SizedBox(height: 1.h,),
            CustomPhoneTextFormField(controller: phoneController,),
            SizedBox(height: 2.h,),
            const Spacer(),
            DefaultButton(() { }, "Save"),

          ],
        ),
      ),
    );
  }
}
