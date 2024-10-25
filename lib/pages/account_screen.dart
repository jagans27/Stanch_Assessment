import 'package:flutter/material.dart';
import 'package:stanchproj/utils/color_util.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.primaryWhite,
      body: const Center(child: Text("AccountScreen")),
    );
  }
}
