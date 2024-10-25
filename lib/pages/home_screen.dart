import 'package:flutter/material.dart';
import 'package:stanchproj/utils/color_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.primaryWhite,
      body: const Center(child: Text("HomeScreen")),
    );
  }
}