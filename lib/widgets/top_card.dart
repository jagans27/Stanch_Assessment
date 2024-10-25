import 'package:flutter/material.dart';
import 'package:stanchproj/bos/meetup_bo.dart';
import 'package:stanchproj/utils/color_util.dart';

class TopCard extends StatelessWidget {
  final MeetupBO meetupBO;

  const TopCard({super.key, required this.meetupBO});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 175,
          width: 165,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(meetupBO.images[0]), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorUtil.primaryWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              meetupBO.top.toString().padLeft(2, '0'),
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: ColorUtil.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
