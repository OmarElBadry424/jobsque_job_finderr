import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import '../../../View/Widgets/color.dart';
import '../../model/NotificationSettingsModel.dart';
import '../../view_model/profile_cubit.dart';
class CustomNotificationsSettingItem extends StatefulWidget {
  final NotificationSettingsModel setting;
  final int index;
  final bool? otherNotifications;
  final Color? textColor;
  final double? fontSize;

  const CustomNotificationsSettingItem(this.setting,
      {super.key, this.textColor = AppTheme
          .blac, this.fontSize = 13.5, required this.index, this.otherNotifications = false});

  @override
  State<CustomNotificationsSettingItem> createState() =>
      _CustomNotificationsSettingItemState();
}

class _CustomNotificationsSettingItemState
    extends State<CustomNotificationsSettingItem> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.setting.label,
        style: TextStyle(
          color: AppTheme.lightgre,
          fontSize: widget.fontSize!.sp,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular,


        ),
      ),
      trailing: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return CupertinoSwitch(
            activeColor: AppTheme.midblu,
            thumbColor: widget.setting.mode ? AppTheme.halfwitmov : AppTheme
                .whiti3,
            // when the switch is off
            trackColor: AppTheme.whitii,
            // boolean variable value
            value: widget.setting.mode,
            onChanged: (value) {
              if (widget.otherNotifications!) {
                cubit.selectSettingNotificationItem(
                    otherNotificationettings, widget.index, value);
              }
              else {
                cubit.selectSettingNotificationItem(
                    notificationettings, widget.index, value);
              }
            },
          );
        },
      ),
    );
  }
}