import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stanchproj/bos/meetup_bo.dart';
import 'package:stanchproj/utils/color_util.dart';
import 'package:stanchproj/utils/extensions.dart';
import 'package:stanchproj/utils/image_path.dart';
import 'package:stanchproj/widgets/custom_icon_button.dart';

class DescriptionScreen extends StatefulWidget {
  final MeetupBO meetupData;
  const DescriptionScreen({super.key, required this.meetupData});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int carouselIndex = 0;
  final platform = const MethodChannel('com.example.stanchproj/share');

  void _shareContent() async {
    String textToShare = "Check out this meetup: ${widget.meetupData.about}";

    try {
      await platform.invokeMethod('shareText', {'text': textToShare});
    } on PlatformException catch (e) {
      print("Failed to share: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.primaryWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: ColorUtil.primaryWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                iconSize: 18,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            leadingWidth: 30,
            backgroundColor: ColorUtil.primaryWhite,
            title: Text(
              "Description",
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            scrolledUnderElevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 350,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color: ColorUtil.placeholderColor.withOpacity(.3),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 310,
                        child: Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: widget.meetupData.images.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          widget.meetupData.images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: 310, 
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    carouselIndex = index;
                                  });
                                },
                              ),
                            ),
                            Positioned(
                              bottom:
                                  10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  widget.meetupData.images.length,
                                  (index) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 6),
                                    child: CircleAvatar(
                                      radius: 4.5,
                                      backgroundColor: carouselIndex == index
                                          ? ColorUtil.primaryWhite
                                          : ColorUtil.primaryWhite
                                              .withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomIconButton(
                                onTap: () {},
                                icon: ImagePath.downloadIcon,
                                color: ColorUtil.placeholderColor),
                            CustomIconButton(
                                onTap: () {},
                                icon: ImagePath.saveIcon,
                                color: ColorUtil.placeholderColor),
                            CustomIconButton(
                                onTap: () {},
                                icon: ImagePath.heartIcon,
                                color: ColorUtil.placeholderColor),
                            CustomIconButton(
                                onTap: () {},
                                icon: ImagePath.cropIcon,
                                color: ColorUtil.primaryBlack),
                            CustomIconButton(
                                onTap: () {},
                                icon: ImagePath.starIcon,
                                color: ColorUtil.primaryBlack),
                            CustomIconButton(
                                onTap: () {
                                  _shareContent();
                                },
                                icon: ImagePath.shareIcon,
                                color: ColorUtil.primaryBlack),
                          ]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImagePath.saveIcon,
                      width: 17,
                      height: 17,
                      colorFilter: ColorFilter.mode(
                          ColorUtil.secondaryColor, BlendMode.srcIn),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: Text(widget.meetupData.saveCount.toString(),
                          style: TextStyle(
                              color: ColorUtil.primaryBlack, fontSize: 14)),
                    ),
                    SvgPicture.asset(
                      ImagePath.heartIcon,
                      width: 17,
                      height: 17,
                      colorFilter: ColorFilter.mode(
                          ColorUtil.secondaryColor, BlendMode.srcIn),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: Text(widget.meetupData.favCount.toString(),
                          style: TextStyle(
                              color: ColorUtil.primaryBlack, fontSize: 14)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      decoration: BoxDecoration(
                        color: ColorUtil.placeholderColor.withOpacity(.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: List.generate(
                          5,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: SvgPicture.asset(
                                ImagePath.starFillIcon,
                                width: 12,
                                colorFilter: ColorFilter.mode(
                                  (index < widget.meetupData.rating.floor())
                                      ? ColorUtil.favColor
                                      : (widget.meetupData.rating > index &&
                                              widget.meetupData.rating <
                                                  (index + 1))
                                          ? ColorUtil.favColor.withOpacity(0.5)
                                          : ColorUtil.primaryWhite,
                                  BlendMode.srcIn,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(widget.meetupData.rating.toString(),
                          style: TextStyle(
                              color: ColorUtil.secondaryColor, fontSize: 14)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Actor Name",
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      widget.meetupData.actorName,
                      style: TextStyle(
                        color: ColorUtil.placeholderColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(
                    ImagePath.clockIcon,
                    width: 18,
                    colorFilter: ColorFilter.mode(
                        ColorUtil.placeholderColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Duration ${widget.meetupData.mins} Mins",
                    style: TextStyle(
                      color: ColorUtil.placeholderColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(
                    ImagePath.walletIcon,
                    width: 18,
                    colorFilter: ColorFilter.mode(
                        ColorUtil.placeholderColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Total Average Fees ₹${widget.meetupData.fees.toCommaSeparated()}",
                    style: TextStyle(
                      color: ColorUtil.placeholderColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About",
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.meetupData.about,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ColorUtil.placeholderColor,
                  fontSize: 14,
                ),
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 6, top: 6),
                  child: Text("See More",
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
