import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:tharuncalllogaccessproject/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  final String name;
  final String number;
  final String callType;
  final String timeBack;

  const UserprofileItemWidget( {Key? key, required this.name,
    required this.number,
    required this.callType,
    required this.timeBack,})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleLarge,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    timeBack,
                    style: CustomTextStyles.bodyLarge16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Text(
            number,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 3.v),
          Text(
            callType,
            style: CustomTextStyles.bodyLargeGray700,
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
