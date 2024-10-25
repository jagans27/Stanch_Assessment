import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stanchproj/bos/trending_bo.dart';
import 'package:stanchproj/utils/color_util.dart';
import 'package:stanchproj/utils/extensions.dart';

class TrendingCard extends StatelessWidget {
  final TrendingBO trendingBO;
  const TrendingCard({super.key, required this.trendingBO});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorUtil.primaryColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: ColorUtil.primaryColor),
                ),
                child: Center(
                  child:
                      SvgPicture.asset(trendingBO.logo, width: 15, height: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trendingBO.title,
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${trendingBO.count.toCommaSeparated()} Meetups",
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Divider(
              thickness: 1,
              color: ColorUtil.primaryColor.withOpacity(.2),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: List.generate(
              trendingBO.images.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(left: index * 30),
                  child: ClipOval(
                    child: Image.asset(
                      trendingBO.images[index],
                      width: 43,
                      height: 43,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 85,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorUtil.secondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("See more",
                      style: TextStyle(
                          color: ColorUtil.primaryWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              )),
        ],
      ),
    );
  }
}
