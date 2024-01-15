import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:jobsque/profile/view/screen/profile%20picture.dart';
import 'package:sizer/sizer.dart';
import '../../../Local/cache helper.dart';
import '../../../Local/enum.dart';
import '../../../View/Widgets/color.dart';
import '../../../View/Widgets/snack bar.dart';
import '../../../View/Widgets/dfault header.dart';
import '../../../router/app_route.dart';
import '../../view_model/profile_cubit.dart';
import '../widgets/general_data.dart';
import '../widgets/others_data.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=ProfileCubit.get(context)
      ..loadSavedProfileImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        'Profile',context,leading: false,
        actions: [
          IconButton(
            onPressed: () {
              CashHelper.removeCacheKey(key: MySharedKeys.token).then((value) {
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
                showSuccessSnackBar(context: context, message: 'Logged out Successfully');

              });

            },
            icon: const Icon(
              Iconsax.logout_1,
              color: Colors.red,
            ),
          )
        ],
        backgroundColor: AppTheme.halfwitmov,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 70)),

            ProfilePic(),

             SizedBox(height: 1.h,),
            const GeneralDataListTile(),
            const DefaultHeader('Others'),
            const OtherDataListTile()
          ],
        ),
      ),
    );
  }
}




