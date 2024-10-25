import 'package:flutter/material.dart';
import 'package:stanchproj/utils/color_util.dart';

class ProletScreen extends StatefulWidget {
  const ProletScreen({super.key});

  @override
  State<ProletScreen> createState() => _ProletScreenState();
}

class _ProletScreenState extends State<ProletScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.primaryWhite,
      body: const Center(child: Text("ProletScreen")),
    );
  }
}