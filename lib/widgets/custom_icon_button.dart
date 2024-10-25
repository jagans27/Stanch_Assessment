import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final Function onTap;
  final String icon;
  final Color color;
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTap(),
        constraints: const BoxConstraints(),
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
        ),
        icon: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ));
  }
}
