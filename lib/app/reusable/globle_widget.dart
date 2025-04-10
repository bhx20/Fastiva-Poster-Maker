import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/reusable/reusable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'app_widgets/grid_layout.dart';

//==============================================================================
// ** Global SnackBar **
//==============================================================================

showToast(String message) {
  Fluttertoast.showToast(
    msg: message.tr,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    textColor: AppColors.white,
    fontSize: 10.sp,
    backgroundColor: AppColors.black,
  );
}

//==============================================================================
// ** Global Grid Layout **
//==============================================================================

SliverGridDelegate addGrid() {
  return SliverStairedGridDelegate(
    mainAxisSpacing: 1.h,
    pattern: [
      const StairedGridTile(0.5, 9 / 16),
      const StairedGridTile(0.5, 9 / 16),
      const StairedGridTile(0.5, 9 / 16),
      const StairedGridTile(0.5, 9 / 16),
    ],
  );
}

SliverGridDelegate grid() {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 9 / 16,
    crossAxisSpacing: 1.h,
    mainAxisSpacing: 1.h,
  );
}

//==============================================================================
// ** App Empty Widget **
//==============================================================================

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

//==============================================================================
// ** App Text Widget **
//==============================================================================

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabe;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColo;

  const AppText(this.data,
      {super.key,
      this.style,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabe,
      this.textWidthBasis,
      this.textHeightBehavior,
      this.selectionColo,
      this.strutStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      data.tr,
      locale: locale,
      style: style,
      key: key,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      selectionColor: selectionColo,
      semanticsLabel: semanticsLabe,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
//==============================================================================
// ** App Simmer Loader **
//==============================================================================

class SimmerLoader extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? baseColor;
  final Color? highlightColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? decorationColor;

  const SimmerLoader({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.baseColor,
    this.highlightColor,
    this.padding,
    this.margin,
    this.decorationColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.grey.withOpacity(0.1),
      highlightColor: highlightColor ?? AppColors.white.withOpacity(0.5),
      child: Container(
        margin: margin,
        width: width ?? Get.width,
        height: Get.height < 700 ? height ?? 150 : height ?? Get.height * 0.205,
        decoration: BoxDecoration(
          color: decorationColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
      ),
    );
  }
}

//==============================================================================
// ** App Paginated Loader **
//==============================================================================

class PaginatedLoader extends StatelessWidget {
  const PaginatedLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Transform.scale(
            scale: 0.5, child: const CircularProgressIndicator(strokeWidth: 4)),
      ),
    );
  }
}

//==============================================================================
// ** Loading Ads Widget **
//==============================================================================

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: AppText(LocalString.loading, style: poppins.get9.w600),
        ),
        SizedBox(
          width: 4.w,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return AppText('.' * (_controller.value * 5).floor(),
                  maxLines: 1, style: poppins.get9.w600);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//==============================================================================
// ** Check Connection Widget **
//==============================================================================

class CheckConnection extends StatelessWidget {
  final String title;
  final Widget child;
  const CheckConnection({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: NoConnection(title: title),
      child: child,
    );
  }
}
