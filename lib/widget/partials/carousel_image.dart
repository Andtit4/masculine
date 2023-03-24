import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/plug.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TiCarousel extends StatefulWidget {
  final double width;
  final double height;
  final List<String> imgList;
  late bool cred;
  // final List<String> caption;
  TiCarousel(
      {super.key,
      required this.height,
      required this.width,
      required this.cred,
      // required this.caption,
      required this.imgList});

  @override
  State<TiCarousel> createState() => _TiCarouselState();
}

class _TiCarouselState extends State<TiCarousel> {
  PageController _controller = PageController();
  int currentPage = 0;
  Timer? timer;
  Icon _iconbtn = Icon(
    Icons.arrow_right_alt_outlined,
    // color: Colors.white,
  );

  String _caption =
      "Offrez à votre peau le soin qu'elle mérite et révélez votre éclat naturel avec nos soins du visage de qualité professionnelle !";
  List<String> captionList = [
    "Offrez à votre peau le soin qu'elle mérite et révélez votre éclat naturel avec nos soins du visage de qualité professionnelle !",
    "Détendez-vous complètement et laissez-nous prendre soin de votre corps et de votre esprit",
    "Transformez votre look avec une coupe de cheveux personnalisée qui mettra en valeur votre beauté naturelle."
  ];

  increment() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentPage != 2) {
        setState(() {
          currentPage++;
        });
        switch (currentPage) {
          case 0:
            setState(() {
              _caption =
                  "Offrez à votre peau le soin qu'elle mérite et révélez votre éclat naturel avec nos soins du visage de qualité professionnelle !";
            });
            break;
          case 1:
            setState(() {
              _caption =
                  "Détendez-vous complètement et laissez-nous prendre soin de votre corps et de votre esprit";
            });
            break;
          case 2:
            setState(() {
              _caption =
                  "Transformez votre look avec une coupe de cheveux personnalisée qui mettra en valeur votre beauté naturelle.";
            });
            break;
        }
      } else {
        _controller.jumpToPage(0);
        switch (currentPage) {
          case 0:
            setState(() {
              _caption =
                  "Offrez à votre peau le soin qu'elle mérite et révélez votre éclat naturel avec nos soins du visage de qualité professionnelle !";
            });
            break;
          case 1:
            setState(() {
              _caption =
                  "Détendez-vous complètement et laissez-nous prendre soin de votre corps et de votre esprit";
            });
            break;
          case 2:
            setState(() {
              _caption =
                  "Transformez votre look avec une coupe de cheveux personnalisée qui mettra en valeur votre beauté naturelle.";
            });
            break;
        }
      }
      _controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      print(currentPage);
    });
  }

  change() async {
    print("__BEFORE__STATE__:${widget.cred}");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = false;
    var tmp = await PageControl().togglePageShow(value, prefs);

    widget.cred   ==  PageControl().togglePageShowGet(prefs);

    // widget.cred = tmp;

    // 

    print("__CHANGE__STATE__:${widget.cred}");
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    increment();
    // change();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: widget.imgList
                  .map((e) => Container(
                        width: widget.width,
                        height: widget.height,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network(
                          e,
                          fit: BoxFit.cover,
                        ),
                      ))
                  .toList()),
          Positioned(
            top: widget.height * .03,
            left: 10,
            child: GestureDetector(
              onTap: () {
                change();
                Get.to(() => BottomNavBar());
              },
              child: Container(
                  width: widget.width * .2,
                  height: widget.height * .06,
                  margin: EdgeInsets.only(top: widget.height * .02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Center(
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: widget.height * .05,
            right: 10,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  width: widget.width * .2,
                  height: widget.height * .07,
                  decoration: BoxDecoration(
                      /* border: Border.all(width: 1, color: Colors.white) */),
                  child: Center(child: Image.asset("assets/logo1.png"))),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: widget.width,
                height: widget.height * .8,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              )),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: widget.width,
                height: widget.height * .25,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                            width: widget.width * .1,
                            height: 1,
                            margin: EdgeInsets.only(left: 10),
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        width: widget.width * .9,
                        child: Text(
                          _caption,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: widget.height * .02,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Vibration.vibrate(amplitude: 30, duration: 30);
                              // Get.to(() => BottomNavBar());
                              if (currentPage != 2) {
                                setState(() {
                                  currentPage++;
                                });
                                _controller.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                              } else if (currentPage == 1) {
                                setState(() {
                                  _iconbtn == Icon(Icons.login);
                                });
                              } else {
                                Get.to(() => BottomNavBar());
                              }
                            },
                            child: Container(
                                width: widget.width * .2,
                                height: widget.height * .06,
                                margin:
                                    EdgeInsets.only(top: widget.height * .02),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: _iconbtn),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
