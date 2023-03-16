import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';
import 'package:masculine/widget/screens/cat_1/soins_des_pieds.dart';

class SoinsDuVisage extends StatefulWidget {
  const SoinsDuVisage({super.key});

  @override
  State<SoinsDuVisage> createState() => _SoinsDuVisageState();
}

class _SoinsDuVisageState extends State<SoinsDuVisage> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: width * .2,
                        height: height * .08,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Icon(Icons.arrow_back)),
                  ),
                  /*                  Text(
                    "Service pour homme",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ), */
                  SizedBox()
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Container(
                  width: width,
                  height: height * .3,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
                                  'Soins du visage',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                                /*  Container(
                                  width: width * .08,
                                  height: 1,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Colors.white,
                                ), */
                                /*  Text(
                                  '08h à 18h',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ), */
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
              SizedBox(
                width: width,
                height: height * .4,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => DescribePage(
                                    img:
                                        'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                    title: 'Soins visage gommage simple ',
                                    montant: '12 500 XOF',
                                  ),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight);
                          /* Get.to(() => SoinsDesPieds(),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight); */
                        },
                        child: Container(
                          width: width,
                          height: height * .2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: width,
                                height: height * .8,
                                padding: EdgeInsets.all(width * .04),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black,
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Soins visage gommage simple ',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                          '12 500 XOF',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => DescribePage(
                                    img:
                                        'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                    title: 'Soins visage revitalisant',
                                    montant: '20 000 XOF',
                                  ),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          width: width,
                          height: height * .2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: width,
                                height: height * .8,
                                padding: EdgeInsets.all(width * .04),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black,
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Soins visage revitalisant',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                          '20 000 XOF',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => DescribePage(
                                    img:
                                        'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                    title: 'Soins purifiant',
                                    montant: '20 000 XOF',
                                  ),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          width: width,
                          height: height * .2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: width,
                                height: height * .8,
                                padding: EdgeInsets.all(width * .04),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black,
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Soins purifiant',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                          '20 000 XOF',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => DescribePage(
                                    img:
                                        'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                    title: 'Soins anti-âge',
                                    montant: '30 000 XOF',
                                  ),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          width: width,
                          height: height * .2,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: width,
                                height: height * .8,
                                padding: EdgeInsets.all(width * .04),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black,
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Soins anti-âge',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                          '30 000 XOF',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
