import '../call_log_screen/widgets/userprofile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:tharuncalllogaccessproject/core/app_export.dart';
import 'package:call_log/call_log.dart';
import 'package:timeago/timeago.dart' as timeago;
String formatCallDuration(int durationInSeconds) {
  Duration duration = Duration(seconds: durationInSeconds);
  
  // Formatting to always show minutes and seconds, and hours if greater than 0.
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  // Constructing the duration string based on whether there are any hours.
  String formattedDuration;
  if (duration.inHours > 0) {
    formattedDuration = "$hours:$minutes:$seconds";
  } else {
    formattedDuration = "$minutes:$seconds";
  }

  return formattedDuration;
}



class CallLogScreen extends StatelessWidget {
  const CallLogScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 26.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 39.v,
                  width: 101.h,
                  margin: EdgeInsets.only(left: 4.h),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Call log",
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 2.v),
                          child: SizedBox(
                            width: 82.h,
                            child: Divider(
                              indent: 3.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.v),
                _buildUserProfile(context),
                SizedBox(height: 40.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {


       return FutureBuilder(
      future: CallLog.get(),
      builder: (context, AsyncSnapshot<Iterable<CallLogEntry>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while fetching call logs.
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final callLogs = snapshot.data?.toList() ?? [];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
      
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: callLogs.length,
          itemBuilder: (context, index) {
                  // Convert the timestamp to a DateTime object
DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(callLogs[index].timestamp!);

// Get the time ago string
String result = timeago.format(dateTime);
String callTypeString = "";
    switch (callLogs[index].callType) {
      case CallType.incoming:
        callTypeString = "Incoming Call Duration : "+formatCallDuration(callLogs[index].duration ?? 0);
        break;
      case CallType.outgoing:
        callTypeString = "Outgoing Call Duration :"+formatCallDuration(callLogs[index].duration ?? 0);
        break;
      case CallType.missed:
        callTypeString = "Missed Call";
        break;
      case CallType.rejected:
        callTypeString = "Rejected";
        break;
      case CallType.blocked:
        callTypeString = "Blocked";
        break;
      case CallType.voiceMail:
        callTypeString = "Voice Mail";
        break;
      // Handle other cases if necessary
      default:
        callTypeString = "Unknown";
        break;
    }
            return UserprofileItemWidget(name: callLogs[index].name ?? "Unknown",
                    number: callLogs[index].number ?? "Unknown",
                    callType: callTypeString,
                    timeBack: result ?? "");
          },
        ),
      ),
    );
        }
      
  });
}
}
