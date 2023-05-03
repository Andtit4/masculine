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
    "https://resize.prod.docfr.doc-media.fr/rcrop/1200,675,center-middle/ext/eac4ff34/content/2022/8/27/1664303710444.jpeg",
    "https://cdn.pixabay.com/photo/2017/03/10/16/54/hand-massage-2133272_1280.jpg",
    "https://cdn.pixabay.com/photo/2018/02/25/17/58/the-hand-3181279_1280.jpg",
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
