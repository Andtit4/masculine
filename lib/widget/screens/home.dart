import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/partials/carousel_image.dart';
import 'package:masculine/widget/screens/cat_1/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;

    List<String> imgList = [
      "https://images.pexels.com/photos/7389078/pexels-photo-7389078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/7697361/pexels-photo-7697361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ];

    return Scaffold(
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
              Text(
                'Welcome \nto Masculine',
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.bold),
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
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/4148931/pexels-photo-4148931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.cover,
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
                                Text(
                                  'Lundi à Vendredi',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Container(
                                  width: width * .08,
                                  height: 1,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Colors.white,
                                ),
                                Text(
                                  '08h à 18h',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Samedi à Dimanche',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Container(
                                  width: width * .08,
                                  height: 1,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Colors.white,
                                ),
                                Text(
                                  '08h à 12h',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
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
              Container(
                width: width * .3,
                height: 1,
                color: Colors.black,
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
                                    "Homme",
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
                    onTap: () {},
                    child: Container(
                      width: width * .45,
                      height: height * .38,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Stack(
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
                                    "Femme",
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
