import 'package:festiva_poster/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/profile/controllers/profile_controller.dart';

showActionManu(GlobalKey menuKey,
    {required void Function() onEdit, required void Function() onDelete}) {
  var c = Get.find<ProfileController>();
  final RenderBox renderBox =
      menuKey.currentContext!.findRenderObject() as RenderBox;
  final Offset position = renderBox.localToGlobal(Offset.zero);

  showMenu(
    color: AppColors.white,
    context: Get.context!,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy + renderBox.size.height,
      position.dx + renderBox.size.width,
      0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 0.5,
    items: c.items.asMap().entries.map((entry) {
      int index = entry.key;
      var item = entry.value;

      return PopupMenuItem<int>(
        value: index + 1,
        onTap: () {
          if (index == 0) {
            onEdit();
          } else {
            onDelete();
          }
        },
        child: SizedBox(
          width: 80,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  item.title,
                  style: poppins.get10,
                  textAlign: TextAlign.center, // Ensure text is centered
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}
