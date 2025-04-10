import 'package:festiva_poster/app/uttils/colorPicker/bloc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/core.dart';
import '../../../../../../model/local/edit_poster_model.dart';
import '../../../../../../reusable/app_widgets/slider.dart';
import '../../../../../../reusable/globle_widget.dart';
import '../../../../../../reusable/images/default_image.dart';
import '../../../../../../uttils/uttils.dart';
import '../../../../controllers/edit_poster_controller.dart';

class LockIcon extends StatelessWidget {
  final RxBool lock;
  const LockIcon({super.key, required this.lock});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        onPressed: () {
          if (lock.isTrue) {
            lock(false);
          } else {
            lock(true);
          }
        },
        icon: Container(
            height: 3.5.h,
            width: 3.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(1),
            child: DefaultImage(
              lock.isTrue ? AppIcon.lockFill : AppIcon.lock,
              color: lock.isTrue ? AppColors.appColor : AppColors.black,
            )),
      ),
    );
  }
}

class ResetLogo extends StatelessWidget {
  final Function() onPressed;
  const ResetLogo({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
          height: 3.5.h,
          width: 3.5.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          child: const DefaultImage(
            AppIcon.reset,
          )),
    );
  }
}

class SelectProfile extends StatelessWidget {
  final Function() onPressed;
  const SelectProfile({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: AppColors.trans,
      splashColor: AppColors.trans,
      child: Container(
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey.withOpacity(0.3))),
          padding: EdgeInsets.all(0.6.h),
          margin: EdgeInsets.only(top: 0.5.h, right: 2.w),
          child: const DefaultImage(
            AppIcon.switchProfile,
          )),
    );
  }
}

class ResetFrame extends StatelessWidget {
  final Function() onPressed;
  const ResetFrame({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: AppColors.trans,
      splashColor: AppColors.trans,
      child: Container(
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey.withOpacity(0.3))),
          padding: EdgeInsets.all(0.6.h),
          margin: EdgeInsets.only(top: 0.5.h, right: 2.w),
          child: const DefaultImage(
            AppIcon.reset,
          )),
    );
  }
}

class HideFrame extends GetView<EditPosterController> {
  final Rx<FrameSettings> data;
  const HideFrame({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data.value.isFrame.isTrue) {
          data.value.isFrame(false);
        } else {
          data.value.isFrame(true);
        }

        data.value.hideFrame();
      },
      highlightColor: AppColors.trans,
      splashColor: AppColors.trans,
      child: Container(
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey.withOpacity(0.3))),
          padding: EdgeInsets.all(0.6.h),
          margin: EdgeInsets.only(top: 0.5.h, right: 2.w),
          child: Obx(() => DefaultImage(
                data.value.isFrame.isTrue
                    ? AppIcon.hideFrameFill
                    : AppIcon.hideFrame,
                color: data.value.isFrame.isTrue
                    ? AppColors.appColor
                    : AppColors.grey,
              ))),
    );
  }
}

class PreviewIcon extends StatelessWidget {
  final RxBool preview;
  final Function()? onPressed;
  const PreviewIcon({super.key, required this.preview, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        onPressed: onPressed ??
            () {
              if (preview.isTrue) {
                preview(false);
              } else {
                preview(true);
              }
            },
        icon: SizedBox(
            height: 3.5.h,
            width: 3.5.h,
            child: Icon(
              preview.isTrue ? Icons.visibility : Icons.visibility_off,
              color: preview.isTrue ? AppColors.black : AppColors.appColor,
            )),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final Rx<Color> selectedColor;
  final String? title;
  final Function() onTap;
  const ColorPicker(
      {super.key,
      required this.selectedColor,
      required this.onTap,
      this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Obx(
          () => Container(
              height: 4.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              padding: EdgeInsets.only(left: 2.w),
              margin: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  AppText(title ?? LocalString.color,
                      style: poppins.black.w600.get9),
                  Container(
                    width: 8.w,
                    decoration: BoxDecoration(
                        color: selectedColor.value,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  ),
                ],
              )),
        ));
  }
}

class ShapeIcon extends StatelessWidget {
  final Function() onTap;
  final String? title;
  const ShapeIcon({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.only(left: 2.w),
          margin: EdgeInsets.only(left: 1.h),
          child: Row(
            children: [
              AppText(title ?? LocalString.shape,
                  style: poppins.black.w600.get9),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: DefaultImage(AppIcon.radius, width: 5.w),
              ),
            ],
          )),
    );
  }
}

class FontIcon extends StatelessWidget {
  final Function() onTap;
  final String? title;
  const FontIcon({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.only(left: 2.w),
          margin: EdgeInsets.only(left: 1.h),
          child: Row(
            children: [
              AppText(title ?? LocalString.fonts,
                  style: poppins.black.w600.get9),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: DefaultImage(AppIcon.font, width: 5.w),
              ),
            ],
          )),
    );
  }
}

class Font extends GetView<EditPosterController> {
  final String title;
  final Function() titleTap;
  final RxInt selectedIndex;
  final RxString selectedFont;
  final String content;
  const Font({
    Key? key,
    required this.title,
    required this.titleTap,
    required this.selectedIndex,
    required this.selectedFont,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Column(
        children: [
          _leadingTool(),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 16 / 2.5,
                  crossAxisSpacing: 1.h,
                  mainAxisSpacing: 1.h),
              itemCount: fontFamilies.length,
              itemBuilder: (context, index) {
                return Obx(() => InkWell(
                      onTap: () {
                        selectedIndex.value = index;
                        selectedFont.value = fontFamilies[index];
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedIndex.value == index
                                    ? AppColors.appColor
                                    : AppColors.grey.withOpacity(0.15))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Center(
                            child: AppText(content,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: fontFamilies[index],
                                ).w600.get9),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _leadingTool() {
    return LeadingTool(
      onPressed: titleTap,
      title: title,
    );
  }
}

class MarginIcon extends StatelessWidget {
  final Function() onTap;
  final String? title;
  const MarginIcon({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.only(left: 2.w),
          margin: EdgeInsets.only(left: 1.h),
          child: Row(
            children: [
              AppText(title ?? LocalString.frameMargin,
                  style: poppins.black.w600.get9),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: DefaultImage(AppIcon.margin, width: 5.w),
              ),
            ],
          )),
    );
  }
}

class BorderIcon extends StatelessWidget {
  final Function() onTap;
  const BorderIcon({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.only(left: 2.w),
          margin: EdgeInsets.only(left: 1.h),
          child: Row(
            children: [
              AppText(LocalString.border, style: poppins.black.w600.get9),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: DefaultImage(AppIcon.border, width: 5.w),
              ),
            ],
          )),
    );
  }
}

class ContentAlign extends StatelessWidget {
  final Function() onTap;
  const ContentAlign({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.only(left: 2.w),
          margin: EdgeInsets.only(left: 1.h),
          child: Row(
            children: [
              AppText(LocalString.contentAlign, style: poppins.black.w600.get9),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: DefaultImage(AppIcon.align, width: 5.w),
              ),
            ],
          )),
    );
  }
}

class LeadingTool extends StatelessWidget {
  final Function() onPressed;
  final Function()? backTap;
  final String title;
  final bool isBack;

  const LeadingTool(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isBack = false,
      this.backTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBack
            ? IconButton(
                onPressed: backTap,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ))
            : IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.close,
                )),
        AppText(title, style: poppins.black.w600),
        IconButton(
            onPressed: backTap ?? onPressed,
            icon: const Icon(
              Icons.check,
              color: AppColors.appColor,
            )),
      ],
    );
  }
}

class SelectColor extends GetView<EditPosterController> {
  final String title;
  final Function() leadingTap;
  final RxDouble opacity;
  final Rx<Color> selectedColor;
  const SelectColor({
    required this.title,
    super.key,
    required this.leadingTap,
    required this.opacity,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LeadingTool(
          onPressed: leadingTap,
          title: title,
          isBack: true,
          backTap: leadingTap,
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 15.w,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: AppSlider(
                    trackStock: 5.0,
                    value: opacity,
                    min: 0.0,
                    max: 1.0,
                    title: LocalString.opacity,
                    onChanged: (value) {
                      opacity.value = value;
                    },
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: BlockPicker(
                    useInShowDialog: true,
                    pickerColor: selectedColor.value,
                    onColorChanged: (color) {
                      selectedColor(color);
                      appPrint(color.toString());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
