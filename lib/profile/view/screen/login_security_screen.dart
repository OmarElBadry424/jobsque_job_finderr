import 'package:flutter/material.dart';
import '../../../Local/cache helper.dart';
import '../../../Local/enum.dart';
import '../../../View/Widgets/default appbar.dart';
import '../../../View/Widgets/dfault header.dart';
import '../../../router/app_route.dart';
import '../widgets/account_access_tile.dart';


class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('Login and security',context),
      body:   SingleChildScrollView(
          child: Column(
            children: [
              const DefaultHeader('Account access'),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    CustomAccountAccessTile(title: "Email address", trailingTitle: CashHelper.getString(key: MySharedKeys.email),
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.emailAddressScreen);
                    },
                    ),
                    CustomAccountAccessTile(title: "Phone number",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.phoneNumberScreen);
                      },
                    ),
                    CustomAccountAccessTile(title: "Change Password",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.changePasswordScreen);
                      },
                    ),
                    CustomAccountAccessTile(
                      title: 'Two-step verification',
                      trailingTitle: 'Non active',
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.twoStepVerification1);
                      },
                    ),
                    const CustomAccountAccessTile(title: 'Face ID'),


                  ],
                ),
              ),

            ],
          )),
    );
  }
}

