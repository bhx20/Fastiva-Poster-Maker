import 'package:festiva_poster/app/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../core/colors.dart';
import '../../core/typography.dart';
import '../reusable.dart';

class AppTextFormField extends StatelessWidget {
  final bool? readOnly;
  final bool? isCounter;
  final String? Function(String?)? validate;
  final String? hintText;
  final IconData? icon;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final double? width;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;
  final int? maxLength;
  final TextInputType? keyboardType;

  const AppTextFormField({
    Key? key,
    this.readOnly,
    this.hintText,
    this.icon,
    this.validate,
    this.controller,
    this.suffix,
    this.width,
    this.onChange,
    this.onTap,
    this.inputFormatters,
    this.maxLength,
    this.keyboardType,
    this.prefix,
    this.label,
    this.isCounter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
            child: AppText(
              label ?? emptyString,
              style: poppins.get9.black.w500,
            ),
          ),
          TextFormField(
            maxLength: maxLength,
            style: poppins.black.w500.get9,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType ?? TextInputType.text,
            onTap: onTap,
            onChanged: onChange,
            readOnly: readOnly ?? false,
            controller: controller,
            validator: validate,
            autofocus: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: AppColors.appColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
              filled: true,
              prefixIcon: prefix,
              fillColor: AppColors.white,
              counterText: isCounter == true ? null : emptyString,
              hintText: hintText,
              hintStyle: poppins.get9.grey.w500,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.appColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.grey.withOpacity(0.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              suffixIcon: suffix,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.appColor,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
