import 'package:flutter/material.dart';
import 'package:stanchproj/bos/carousel_bo.dart';
import 'package:stanchproj/bos/meetup_bo.dart';
import 'package:stanchproj/bos/trending_bo.dart';
import 'package:stanchproj/pages/description_screen.dart';
import 'package:stanchproj/utils/color_util.dart';
import 'package:stanchproj/utils/image_path.dart';
import 'package:stanchproj/widgets/carousel_card_view.dart';
import 'package:stanchproj/widgets/search_textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stanchproj/widgets/top_card.dart';
import 'package:stanchproj/widgets/trending_card.dart';

class MeetupScreen extends StatefulWidget {
  const MeetupScreen({super.key});

  @override
  State<MeetupScreen> createState() => _MeetupScreenState();
}

class _MeetupScreenState extends State<MeetupScreen> {
  final List<CarouselBO> _carousels = [
    CarouselBO(
        title: "Popular Meetups", image: ImagePath.meeting1, country: 'India'),
    CarouselBO(
        title: "Tech Meetups", image: ImagePath.meeting2, country: 'China'),
    CarouselBO(
        title: "Startup Discussion",
        image: ImagePath.meeting3,
        country: 'Sri Lanka'),
  ];
  final List<MeetupBO> _topTrendingCarousel = [
    MeetupBO(
        top: 1,
        images: [ImagePath.meeting1, ImagePath.meeting2, ImagePath.meeting3],
        saveCount: 1230,
        favCount: 2343,
        rating: 3.5,
        actorName: "Indian Actress",
        mins: 20,
        fees: 9999,
        about:
            "From cardiovascular health to fitness. flexibility. balance. stress relief. better sleep. increased cognitive performance, and more. you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp."),
    MeetupBO(
        top: 2,
        images: [
          ImagePath.meeting3,
          ImagePath.meeting1,
          ImagePath.meeting2,
        ],
        saveCount: 1230,
        favCount: 2343,
        rating: 3.5,
        actorName: "Indian Actress",
        mins: 20,
        fees: 9999,
        about:
            "From cardiovascular health to fitness. flexibility. balance. stress relief. better sleep. increased cognitive performance, and more. you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp."),
    MeetupBO(
        top: 3,
        images: [
          ImagePath.meeting2,
          ImagePath.meeting3,
          ImagePath.meeting1,
          ImagePath.meeting2,
          ImagePath.meeting3
        ],
        saveCount: 1230,
        favCount: 2343,
        rating: 3.5,
        actorName: "Indian Actress",
        mins: 20,
        fees: 9999,
        about:
            "From cardiovascular health to fitness. flexibility. balance. stress relief. better sleep. increased cognitive performance, and more. you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp."),
    MeetupBO(
        top: 4,
        images: [ImagePath.meeting1, ImagePath.meeting2, ImagePath.meeting3],
        saveCount: 1230,
        favCount: 2343,
        rating: 3.5,
        actorName: "Indian Actress",
        mins: 20,
        fees: 9999,
        about:
            "From cardiovascular health to fitness. flexibility. balance. stress relief. better sleep. increased cognitive performance, and more. you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp."),
    MeetupBO(
        top: 5,
        images: [ImagePath.meeting2, ImagePath.meeting3, ImagePath.meeting1],
        saveCount: 1230,
        favCount: 2343,
        rating: 3.5,
        actorName: "Indian Actress",
        mins: 20,
        fees: 9999,
        about:
            "From cardiovascular health to fitness. flexibility. balance. stress relief. better sleep. increased cognitive performance, and more. you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp."),
  ];

  final List<TrendingBO> _trending = [
    TrendingBO(title: "Author", count: 1028, logo: ImagePath.leafIcon, images: [
      ImagePath.meeting1,
      ImagePath.meeting2,
      ImagePath.meeting3,
      ImagePath.meeting2,
      ImagePath.meeting3
    ]),
    TrendingBO(title: "Reel", count: 1028, logo: ImagePath.reelIcon, images: [
      ImagePath.meeting3,
      ImagePath.meeting1,
      ImagePath.meeting2,
      ImagePath.meeting3,
      ImagePath.meeting1
    ]),
    TrendingBO(
        title: "Camera",
        count: 1028,
        logo: ImagePath.cameraIcon,
        images: [
          ImagePath.meeting2,
          ImagePath.meeting1,
          ImagePath.meeting3,
          ImagePath.meeting2,
          ImagePath.meeting1
        ]),
  ];

  int carouselIndex = 0;

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
              "Individual Meetup",
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
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: SearchTextField(),
            ),
            const SizedBox(height: 20), 
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    carouselIndex = index;
                  });
                },
              ),
              items: _carousels
                  .map((carousel) => CarouselCardView(carouselBO: carousel))
                  .toList(),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    _carousels.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: CircleAvatar(
                            radius: 4.5,
                            backgroundColor: carouselIndex == index
                                ? ColorUtil.primaryColor
                                : ColorUtil.primaryColor.withOpacity(.5),
                          ),
                        )),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 14),
                child: Text(
                  "Trending Popular People",
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 155,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 18,
                          right: index == _trending.length - 1 ? 20 : 0),
                      child: TrendingCard(trendingBO: _trending[index]),
                    );
                  },
                  itemCount: _trending.length),
            ),

            const SizedBox(height: 25),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 14),
                child: Text(
                  "Top Trending Meetups",
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 175,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 18,
                          right: index == _trending.length - 1 ? 20 : 0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DescriptionScreen(
                                      meetupData: _topTrendingCarousel[index]),
                                ));
                          },
                          child:
                              TopCard(meetupBO: _topTrendingCarousel[index])),
                    );
                  },
                  itemCount: _topTrendingCarousel.length),
            ),

            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
