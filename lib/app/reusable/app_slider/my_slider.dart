import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/colors.dart';

class CarouselSliderWidget extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int, int) itemBuilder;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  final double? carouselHeight;
  final bool padEnds;
  final bool enableInfiniteScroll;
  final int currentIndex;
  final double? viewportFraction;
  final double? aspectRatio;
  final double? enlargeFactor;
  final bool autoPlay;
  final bool disableCenter;
  final bool enlargeCenterPage;
  final bool reverse;
  final bool animateToClosest;
  final Axis? scrollDirection;
  final ScrollPhysics? scrollPhysics;
  final Duration? autoPlayAnimationDuration;

  const CarouselSliderWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onPageChanged,
    this.carouselHeight,
    this.padEnds = true,
    this.enableInfiniteScroll = true,
    this.animateToClosest = true,
    required this.currentIndex,
    this.viewportFraction,
    this.aspectRatio,
    this.enlargeFactor,
    this.autoPlayAnimationDuration,
    this.autoPlay = false,
    this.reverse = false,
    this.scrollPhysics,
    this.disableCenter = false,
    this.enlargeCenterPage = false,
    this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          options: CarouselOptions(
              height: carouselHeight ?? 20.h,
              padEnds: padEnds,
              enableInfiniteScroll: enableInfiniteScroll,
              onPageChanged: onPageChanged,
              aspectRatio: aspectRatio ?? 16 / 9,
              disableCenter: disableCenter,
              enlargeCenterPage: enlargeCenterPage,
              enlargeFactor: enlargeFactor ?? 0.3,
              reverse: reverse,
              viewportFraction: viewportFraction ?? 0.85,
              animateToClosest: animateToClosest,
              scrollPhysics: scrollPhysics,
              autoPlayAnimationDuration: autoPlayAnimationDuration ??
                  const Duration(milliseconds: 800),
              scrollDirection: scrollDirection ?? Axis.horizontal,
              autoPlay: autoPlay),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(itemCount, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: index == currentIndex ? 8.w : 0.6.h,
              height: 0.6.h,
              margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: index == currentIndex
                      ? AppColors.appColor
                      : AppColors.grey.withOpacity(0.3)),
            );
          }),
        )
      ],
    );
  }
}
