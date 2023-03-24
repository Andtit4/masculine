import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/partials/carousel_image.dart';
import 'package:masculine/widget/screens/cat_1/service.dart';
import 'package:masculine/widget/screens/cat_2/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  PageController _controller = PageController();
  int currentPage = 0;
  Timer? timer;

  String _caption =
      "Offrez à votre peau le soin qu'elle mérite et révélez votre éclat naturel avec nos soins du visage de qualité professionnelle !";

  List<String> imgList = [
    "https://images.pexels.com/photos/7389078/pexels-photo-7389078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/7697361/pexels-photo-7697361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/3764568/pexels-photo-3764568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/3997983/pexels-photo-3997983.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'https://www.dreads-expert.com/wp-content/uploads/2021/06/Dreads-courtes-degrade-scaled.jpg',
  ];
  increment() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentPage != 4) {
        setState(() {
          currentPage++;
        });
      } else {
        _controller.jumpToPage(0);
      }
      _controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      print(currentPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    increment();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bienvenue \nà Masculine',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                      width: width * .2,
                      height: height * .07,
                      decoration: BoxDecoration(
                          /* border: Border.all(width: 1, color: Colors.white) */),
                      child: Center(child: Image.asset("assets/logo1.png"))),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                  width: width,
                  height: height * .3,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        controller: _controller,
                        children: imgList
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                      ),
                      Container(
                        width: width,
                        height: height * .8,
                        padding: EdgeInsets.all(width * .04),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Masculine',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Container(
                                  width: width * .1,
                                  height: 1,
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * .85,
                                  child: Text(
                                    'Sublimez votre beauté avec notre gamme complète de services esthétiques haut de gamme. .',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * .3,
                    height: 1,
                    color: Colors.white,
                  ),
                  Container(
                    width: width * .3,
                    height: 1,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ServiceHomme(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                      width: width * .45,
                      height: height * .38,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/904332/pexels-photo-904332.jpeg?auto=compress&cs=tinysrgb&w=1600',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: width * .45,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Lui",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ServiceDame(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                      width: width * .45,
                      height: height * .38,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/2661255/pexels-photo-2661255.jpeg?auto=compress&cs=tinysrgb&w=1600',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: width * .45,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Elle",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
