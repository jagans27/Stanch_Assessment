import 'package:flutter/material.dart';
import 'package:stanchproj/utils/color_util.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const InputTextField(
      {super.key, required this.textEditingController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: ColorUtil.primaryBlack,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorUtil.placeholderColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorUtil.primaryColor, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorUtil.placeholderColor, width: 1.3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorUtil.primaryBlack, width: 1.5)),
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12)),
    );
  }
}
