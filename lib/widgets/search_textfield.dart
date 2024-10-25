import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stanchproj/utils/color_util.dart';
import 'package:stanchproj/utils/image_path.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorUtil.primaryBlack,
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
              color: ColorUtil.placeholderColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 3),
            child: SvgPicture.asset(ImagePath.searchIcon,
                width: 28,
                height: 28,
                colorFilter:
                    ColorFilter.mode(ColorUtil.primaryColor, BlendMode.srcIn)),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(ImagePath.micIcon,
                width: 28,
                height: 28,
                colorFilter:
                    ColorFilter.mode(ColorUtil.primaryColor, BlendMode.srcIn)),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorUtil.primaryColor, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorUtil.primaryColor, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorUtil.primaryBlack, width: 1.5)),
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10)),
    );
  }
}
