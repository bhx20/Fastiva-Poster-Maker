import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/core.dart';
import '../reusable.dart';

class AppSlider extends StatelessWidget {
  final String title;
  final RxDouble value;
  final Function(double)? onChanged;
  final double min;
  final double max;
  final TextStyle? titleStyle;
  final double? trackStock;
  const AppSlider(
      {super.key,
      required this.value,
      this.onChanged,
      required this.min,
      required this.max,
      required this.title,
      this.titleStyle,
      this.trackStock});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3.w, bottom: 1.h),
              child:
                  AppText(title, style: titleStyle ?? poppins.black.w600.get9),
            ),
            SizedBox(
              height: 1.h,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.appColor,
                    inactiveTrackColor: AppColors.grey,
                    trackShape: const RectangularSliderTrackShape(),
                    trackHeight: trackStock ?? 3.0,
                    thumbColor: Colors.white,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0)),
                child: Slider(
                  value: value.value,
                  onChanged: onChanged,
                  min: min,
                  max: max,
                ),
              ),
            ),
          ],
        ));
  }
}
