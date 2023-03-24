import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/carousel_image.dart';
// import 'package:vibration/vibration.dart';

class SplashScreen extends StatefulWidget {
  late bool cred;
  SplashScreen({super.key, required this.cred});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> imgList = [
    "https://images.pexels.com/photos/7389078/pexels-photo-7389078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/7697361/pexels-photo-7697361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2061820/pexels-photo-2061820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  

  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            TiCarousel(
              cred: widget.cred,
              width: width,
              height: height,
              imgList: imgList,
              // caption: captionList,
            ),
          ],
        ),
      ),
    );
  }
}
