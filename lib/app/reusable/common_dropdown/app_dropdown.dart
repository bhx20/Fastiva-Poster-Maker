import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/colors.dart';
import '../../core/constant.dart';
import '../../core/typography.dart';
import '../reusable.dart';

class AppDropdown extends StatefulWidget {
  final String? hintText;
  final List options;
  final String value;
  final String? title;
  final String Function(String) getLabel;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validate;

  const AppDropdown({
    super.key,
    this.hintText,
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
    this.title,
    this.validate,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            child: AppText(
              widget.title ?? emptyString,
              style: poppins.get9.black.w500,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: poppins.w300
                    .textColor(AppColors.white.withOpacity(0.5))
                    .get9,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                filled: true,
                fillColor: AppColors.white.withOpacity(0.2),
                counterText: emptyString,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.appColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.appColor,
                )),
              ),
              validator: (value) {
                if (value != null) {
                  return null;
                } else {
                  return "Value Can't be Empty";
                }
              },
              value:
                  widget.options.contains(widget.value) ? widget.value : null,
              items: List.generate(
                  widget.options.length ?? 0,
                  (index) => DropdownMenuItem(
                        value: widget.options[index],
                        child: AppText(
                          widget.options[index] ?? emptyString,
                        ),
                      )),
              elevation: 2,
              onChanged: widget.onChanged,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.white,
              ),
              focusColor: Colors.transparent,
              style: poppins.white.w300.get9,
              dropdownColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
