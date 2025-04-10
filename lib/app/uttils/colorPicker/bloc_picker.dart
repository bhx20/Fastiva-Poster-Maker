import 'package:festiva_poster/app/core/assets.dart';
import 'package:festiva_poster/app/core/colors.dart';
import 'package:festiva_poster/app/reusable/images/default_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

/// Child widget for layout builder.
typedef PickerItem = Widget Function(Color color);

/// Customize the layout.
typedef PickerLayoutBuilder = Widget Function(
    BuildContext context, List<Color> colors, PickerItem child);

/// Customize the item shape.
typedef PickerItemBuilder = Widget Function(
    Color color, bool isCurrentColor, void Function() changeColor);

const List<Color> _defaultColors = [
  Color(0xFF0071FD),
  Color(0x00000000),
  Color(0xFF000000),
  Color(0xFFFFFFFF),
  Color(0xFFFFEBEE),
  Color(0xFFFFCDD2),
  Color(0xFFEF9A9A),
  Color(0xFFE57373),
  Color(0xFFEF5350),
  Color(0xFFE53935),
  Color(0xFFD32F2F),
  Color(0xFFC62828),
  Color(0xFFB71C1C),
  Color(0xFFE8F5E9),
  Color(0xFFC8E6C9),
  Color(0xFFCCFF90),
  Color(0xFF76FF03),
  Color(0xFF64DD17),
  Color(0xFFA5D6A7),
  Color(0xFF81C784),
  Color(0xFF66BB6A),
  Color(0xFF43A047),
  Color(0xFF388E3C),
  Color(0xFF2E7D32),
  Color(0xFF1B5E20),
  Color(0xFFE3F2FD),
  Color(0xFFBBDEFB),
  Color(0xFF90CAF9),
  Color(0xFF64B5F6),
  Color(0xFF42A5F5),
  Color(0xFF1E88E5),
  Color(0xFF1976D2),
  Color(0xFF1565C0),
  Color(0xFF0D47A1),
  Color(0xFFFFFDE7),
  Color(0xFFFFF9C4),
  Color(0xFFFFF59D),
  Color(0xFFFFF176),
  Color(0xFFFFEE58),
  Color(0xFFFDD835),
  Color(0xFFFBC02D),
  Color(0xFFF9A825),
  Color(0xFFF57F17),
  Color(0xFFF3E5F5),
  Color(0xFFE1BEE7),
  Color(0xFFCE93D8),
  Color(0xFFBA68C8),
  Color(0xFFAB47BC),
  Color(0xFF8E24AA),
  Color(0xFF7B1FA2),
  Color(0xFF6A1B9A),
  Color(0xFF4A148C),
  Color(0xFFFCE4EC),
  Color(0xFFF8BBD0),
  Color(0xFFF48FB1),
  Color(0xFFF06292),
  Color(0xFFEC407A),
  Color(0xFFD81B60),
  Color(0xFFC2185B),
  Color(0xFFAD1457),
  Color(0xFF880E4F),
  Color(0xFFEFEBE9),
  Color(0xFFD7CCC8),
  Color(0xFFBCAAA4),
  Color(0xFFA1887F),
  Color(0xFF8D6E63),
  Color(0xFF6D4C41),
  Color(0xFF5D4037),
  Color(0xFF4E342E),
  Color(0xFF3E2723),
  Color(0xFFFFF3E0),
  Color(0xFFFFE0B2),
  Color(0xFFFFCC80),
  Color(0xFFFFB74D),
  Color(0xFFFFA726),
  Color(0xFFFB8C00),
  Color(0xFFF57C00),
  Color(0xFFEF6C00),
  Color(0xFFE65100),
  Color(0xFFE0F2F1),
  Color(0xFFB2DFDB),
  Color(0xFF80CBC4),
  Color(0xFF4DB6AC),
  Color(0xFF26A69A),
  Color(0xFF00897B),
  Color(0xFF00796B),
  Color(0xFF00695C),
  Color(0xFF004D40),
  Color(0xFFECEFF1),
  Color(0xFFCFD8DC),
  Color(0xFFB0BEC5),
  Color(0xFF90A4AE),
  Color(0xFF78909C),
  Color(0xFF546E7A),
  Color(0xFF455A64),
  Color(0xFF37474F),
  Color(0xFF263238),
];

Widget _defaultLayoutBuilder(
    BuildContext context, List<Color> colors, PickerItem child) {
  return SizedBox(
    width: 300,
    height: 360,
    child: GridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 6,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [for (Color color in colors) child(color)],
    ),
  );
}

Widget _defaultItemBuilder(
    Color color, bool isCurrentColor, void Function() changeColor) {
  return color == const Color(0xFF0071FD)
      ? InkWell(
          onTap: changeColor,
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: DefaultImage(
              AppIcon.empty,
            ),
          ),
        )
      : Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: AppColors.grey.withOpacity(0.15)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: changeColor,
              borderRadius: BorderRadius.circular(50),
              child: color == const Color(0x00000000)
                  ? const Center(
                      child: Text(
                      "T",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ))
                  : AnimatedOpacity(
                      duration: const Duration(milliseconds: 210),
                      opacity: isCurrentColor ? 1 : 0,
                      child: Icon(Icons.done,
                          color: useWhiteForeground(color)
                              ? Colors.white
                              : Colors.black),
                    ),
            ),
          ),
        );
}

class BlockPicker extends StatefulWidget {
  const BlockPicker({
    Key? key,
    required this.pickerColor,
    required this.onColorChanged,
    this.availableColors = _defaultColors,
    this.useInShowDialog = true,
    this.layoutBuilder = _defaultLayoutBuilder,
    this.itemBuilder = _defaultItemBuilder,
  }) : super(key: key);

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;
  final List<Color> availableColors;
  final bool useInShowDialog;
  final PickerLayoutBuilder layoutBuilder;
  final PickerItemBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() => _BlockPickerState();
}

class _BlockPickerState extends State<BlockPicker> {
  late Color _currentColor;

  @override
  void initState() {
    _currentColor = widget.pickerColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() => _currentColor = color);
    widget.onColorChanged(color);
  }

  @override
  Widget build(BuildContext context) {
    return widget.layoutBuilder(
      context,
      widget.availableColors,
      (Color color) => widget.itemBuilder(
        color,
        (_currentColor.value == color.value) &&
            (widget.useInShowDialog
                ? true
                : widget.pickerColor.value == color.value),
        () => changeColor(color),
      ),
    );
  }
}
