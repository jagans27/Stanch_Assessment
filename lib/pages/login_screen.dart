import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stanchproj/pages/root_screen.dart';
import 'package:stanchproj/utils/color_util.dart';
import 'package:stanchproj/utils/image_path.dart';
import 'package:stanchproj/widgets/input_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailOrMobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isSubmitEnabled = false;

  List<String> socialMediaIcon = [
    ImagePath.googleIcon,
    ImagePath.linkedinIcon,
    ImagePath.facebookIcon,
    ImagePath.instagramIcon,
    ImagePath.whatsappIcon
  ];

  @override
  void initState() {
    super.initState();
    _emailOrMobileController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    final email = _emailOrMobileController.text;
    final password = _passwordController.text;
    setState(() {
      _isEmailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
      _isPasswordValid =
          password.isNotEmpty; 
      _isSubmitEnabled = _isEmailValid && _isPasswordValid;
    });
  }

  void _onSubmit() {
    if (_isEmailValid && _isPasswordValid) {
      if (_emailOrMobileController.text == "test@stanch.io" &&
          _passwordController.text == "Test@123") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RootScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid email or password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: ColorUtil.primaryWhite,
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorUtil.primaryWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 10),
                Text("promilo",
                    style: TextStyle(
                        color: ColorUtil.primaryBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 65),
                Text("Hi, Welcome Back!",
                    style: TextStyle(
                        fontSize: 19,
                        color: ColorUtil.textPrimaryColor,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Please Sign in to continue",
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                InputTextField(
                    textEditingController: _emailOrMobileController,
                    hintText: "Enter Email or Mob No."),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Text(
                        "Sign In With OTP",
                        style: TextStyle(
                            color: ColorUtil.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                InputTextField(
                    textEditingController: _passwordController,
                    hintText: "Enter Password"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? status) {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: BorderSide(
                            width: 2, color: ColorUtil.placeholderColor),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                      ),
                      const SizedBox(width: 5),
                      Text("Remember Me",
                          style: TextStyle(
                              color: ColorUtil.placeholderColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {},
                          behavior: HitTestBehavior.translucent,
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: ColorUtil.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _isSubmitEnabled ? _onSubmit : null,
                    style: FilledButton.styleFrom(
                      fixedSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: _isSubmitEnabled
                          ? ColorUtil.primaryColor
                          : ColorUtil.buttonDisableColor,
                    ),
                    child: Text("Submit",
                        style: TextStyle(
                            color: ColorUtil.primaryWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorUtil.placeholderColor.withOpacity(.3),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or"),
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorUtil.placeholderColor.withOpacity(.3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    socialMediaIcon.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: GestureDetector(
                            child: Image.asset(
                          socialMediaIcon[index],
                          height: 30,
                          width: 30,
                        )),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Business User?",
                            style: TextStyle(
                                color: ColorUtil.placeholderColor,
                                fontSize: 15)),
                        GestureDetector(
                          onTap: () {},
                          child: Text("Login Here",
                              style: TextStyle(
                                  color: ColorUtil.secondaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800)),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Don't have an account",
                            style: TextStyle(
                                color: ColorUtil.placeholderColor,
                                fontSize: 15)),
                        GestureDetector(
                          onTap: () {},
                          child: Text("Sign Up",
                              style: TextStyle(
                                  color: ColorUtil.secondaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "By continuing, you agree to",
                  style: TextStyle(
                      color: ColorUtil.placeholderColor.withOpacity(.7),
                      fontSize: 14),
                ),
                const SizedBox(height: 2),
                RichText(
                    text: TextSpan(
                        text: "Promilo's ",
                        style: TextStyle(
                            color: ColorUtil.placeholderColor.withOpacity(.7),
                            fontSize: 14),
                        children: [
                      TextSpan(
                          text: "Terms of Use & Privacy Policy.",
                          style: TextStyle(
                              color: ColorUtil.primaryBlack, fontSize: 15))
                    ])),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
