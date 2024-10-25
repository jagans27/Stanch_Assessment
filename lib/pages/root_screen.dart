import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stanchproj/pages/account_screen.dart';
import 'package:stanchproj/pages/explore_screen.dart';
import 'package:stanchproj/pages/home_screen.dart';
import 'package:stanchproj/pages/meetup_screen.dart';
import 'package:stanchproj/pages/prolet_screen.dart';
import 'package:stanchproj/utils/color_util.dart';
import 'package:stanchproj/utils/image_path.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> _navItems = [
    {'icon': ImagePath.homeIcon, 'label': 'Home'},
    {'icon': ImagePath.proletIcon, 'label': 'Prolet'},
    {'icon': ImagePath.handshakeIcon, 'label': 'Meetup'},
    {'icon': ImagePath.fileIcon, 'label': 'Explore'},
    {'icon': ImagePath.profileIcon, 'label': 'Account'},
  ];

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProletScreen(),
    const MeetupScreen(),
    const ExploreScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: ColorUtil.statusBarPrimary,
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorUtil.primaryWhite,
            elevation: 6,
            items: _navItems.map((item) {
              int index = _navItems.indexOf(item);
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset(
                    item['icon']!,
                    width: 22,
                    height: 22,
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        _selectedIndex == index
                            ? ColorUtil.secondaryColor
                            : ColorUtil.primaryColor,
                        BlendMode.srcIn),
                  ),
                ),
                label: item['label']!,
              );
            }).toList(),
            currentIndex: _selectedIndex,
            selectedItemColor: ColorUtil.secondaryColor,
            unselectedItemColor: ColorUtil.primaryColor,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: ColorUtil.primaryWhite,
          body: Container(
            child: IndexedStack(index: _selectedIndex, children: _pages),
          ),
        ),
      ),
    );
  }
}
