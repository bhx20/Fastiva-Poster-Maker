import 'package:festiva_poster/app/modules/home/controllers/home_controller.dart';
import 'package:festiva_poster/app/modules/home/views/widget/slider_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'category_view.dart';

class HomeLoader extends GetView<HomeController> {
  const HomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SliderView(
          isLoading: true,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoryView(
                index: index,
                isLoading: true,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 1.5.h,
              );
            },
          ),
        )
      ],
    );
  }
}
