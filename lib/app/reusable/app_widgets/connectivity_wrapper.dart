import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:festiva_poster/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../reusable.dart';

class ConnectionWrapper extends StatefulWidget {
  final widget;
  const ConnectionWrapper({
    super.key,
    this.widget,
  });

  @override
  State<ConnectionWrapper> createState() => _ConnectionWrapperState();
}

class _ConnectionWrapperState extends State<ConnectionWrapper> {
  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      child: widget.widget ?? const SizedBox(),
      disableInteraction: true,
      offlineWidget: SafeArea(
        child: appScaffold(
            bottomNavigationBar: const Empty(),
            backgroundColor: AppColors.black.withOpacity(0.2),
            body: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: AppColors.appColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: AppText(
                          LocalString.noInternet,
                          style: poppins.get28.white.w600.space09,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 1.w, right: 1.w, bottom: 10.h),
                        child: AppText(
                          LocalString.connectionIntro,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: poppins.get8.white.w400.space09,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 60); // Start at the top-left corner
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, 60); // Define a quadratic curve
    path.lineTo(size.width,
        size.height); // Draw a straight line to the bottom-right corner
    path.lineTo(
        0, size.height); // Draw a straight line to the bottom-left corner
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
