import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../View/Widgets/Default Font.dart';
import '../../../View/Widgets/color.dart';
import '../../model/notificationModel.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.img), radius: 21.sp),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notification.company,
            style:  TextStyle(
              color: AppTheme.blac,
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.medium,

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              notification.status
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 3.w,
                  height: 1.h,
                  decoration: const BoxDecoration(
                    color: AppTheme.warning6,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                notification.datetime,
                style:  TextStyle(
                  color: AppTheme.lightgre,
                  fontSize: 10.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular,

                ),
              )
            ],
          ),
        ],
      ),
      subtitle: Text(
        notification.subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style:  TextStyle(
          color: AppTheme.lightgre,
          fontSize: 10.sp,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular,
        ),
      ),
        contentPadding:EdgeInsets.zero,

    );
  }
}