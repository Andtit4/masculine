import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/carousel_image.dart';
// import 'package:vibration/vibration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> imgList = [
    "https://images.pexels.com/photos/7389078/pexels-photo-7389078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/7697361/pexels-photo-7697361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            TiCarousel(
              width: width,
              height: height,
              imgList: imgList,
            ),
            Positioned(
              top: height * .05,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  // Vibration.vibrate(amplitude: 30, duration: 30);
                },
                child: Container(
                    width: width * .2,
                    height: height * .07,
                    decoration: BoxDecoration(
                        /* border: Border.all(width: 1, color: Colors.white) */),
                    child: Center(child: Image.asset("assets/logo.png"))),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: height * .8,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                )),
            Positioned(
                bottom: 0,
                child: SizedBox(
                  width: width,
                  height: height * .25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Masculine',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: width * .1,
                              height: 1,
                              margin: EdgeInsets.only(left: 10),
                              color: Colors.white,
                            )
                          ],
                        ),
                        Text(
                          'Coiffure, Soins de visage, Soins de peau, massage',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Vibration.vibrate(amplitude: 30, duration: 30);
                                Get.to(() => BottomNavBar());
                              },
                              child: Container(
                                width: width * .9,
                                height: height * .08,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                  child: Text(
                                    'Get started',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
