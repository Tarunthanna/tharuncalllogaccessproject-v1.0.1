import 'package:flutter/material.dart';
import 'package:tharuncalllogaccessproject/core/app_export.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tharuncalllogaccessproject/presentation/call_log_screen/call_log_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );
 @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Wait for 3 seconds on the splash screen.
    await Future.delayed(Duration(seconds: 3));

    // Check for call log permission.
    PermissionStatus permission = await Permission.phone.request();

    // If permission is granted, navigate to the next screen.
    if (permission.isGranted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CallLogScreen(), // Replace with your next screen widget.
        ),
      );
    } else {
      // Handle permission denied logic here, maybe show a dialog to the user.
      _navigateToNextScreen();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImageProcessin,
                height: 907.v,
                width: 430.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 25.v),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 101.h,
                      right: 101.h,
                      bottom: 511.v,
                    ),
                    decoration: AppDecoration.fillLime,
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Tarun’s",
                                style: theme.textTheme.displayLarge,
                              ),
                              TextSpan(
                                text: " ",
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 5.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Call Log Access",
                            style: CustomTextStyles.titleLargeSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
