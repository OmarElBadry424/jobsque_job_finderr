import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Button.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:sizer/sizer.dart';

import '../../../../Local/cache helper.dart';
import '../../../../Local/enum.dart';
import '../../../../View/Widgets/Default Font.dart';
import '../../../../View/Widgets/Default TextFormField.dart';
import '../../../../View/Widgets/color.dart';


class EmailAddressScreen extends StatelessWidget {
   EmailAddressScreen({Key? key}) : super(key: key);
  TextEditingController emailController=TextEditingController(text: CashHelper.getString(key: MySharedKeys.email));

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: DefaultAppBar("Email Address", context),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Main e-mail address',
                  style: TextStyle(
                    color: AppTheme.blac,
                    fontSize: 13.5.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular,

                  ),
                ),
                SizedBox(height: 1.h,),
                DefaultTextFormField(controller: emailController,
                  prefixIcon: const Icon(Iconsax.sms),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? AppTheme.blac
                      : AppTheme.whitii),
                  hintText: 'Email address', obscureText: false,),
                const Spacer(),
                DefaultButton(() { }, "Save"),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: DefaultButton(() { }, "Save")),
          ],
        ),
      ),
    );
  }
}
