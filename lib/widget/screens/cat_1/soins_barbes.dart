import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';

class SoinsBarbePage extends StatefulWidget {
  final String img;
  final String title;
  const SoinsBarbePage({super.key, required this.img, required this.title});

  @override
  State<SoinsBarbePage> createState() => _SoinsBarbePageState();
}

class _SoinsBarbePageState extends State<SoinsBarbePage> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .04,
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
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(),
                  Container(
                      width: width * .2,
                      height: height * .07,
                      decoration: BoxDecoration(
                          /* border: Border.all(width: 1, color: Colors.white) */),
                      child: Center(child: Image.asset("assets/logo1.png")))
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              SizedBox(
                width: width * .9,
                height: height * .9,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                          width: width,
                          height: height * .3,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                widget.img,
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
                                          'Masculine',
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
                                          widget.title,
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
                          )),
                      SizedBox(
                        height: height * .04,
                      ),
                      Container(
                        width: width * .3,
                        height: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: height * .03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DescribePage(
                                      img:
                                          'https://barbetendance.fr/wp-content/uploads/2020/12/tendance-prend.jpg',
                                      title: 'Barbe Simple',
                                      desc:
                                          "Notre service de soins de barbe simples est une prestation de soins de beauté qui aident à entretenir une barbe saine et bien entretenue. Ces soins consistent généralement en une coupe de barbe, un rasage ou une tonte de la zone autour de la barbe",
                                      montant: '1 000 XOF'),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              width: width,
                              height: height * .2,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://barbetendance.fr/wp-content/uploads/2020/12/tendance-prend.jpg',
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
                                              'Barbe Simple',
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
                                              '1 000 XOF',
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
                                          'https://1.bp.blogspot.com/-Wof6WRZBbfE/X1OypaHDa9I/AAAAAAAAE5M/XtlK6NvlC6ICUoPDHYSfRuBtjuCFY92rQCLcBGAsYHQ/s2048/apresrasage-clarins.jpg',
                                      title: 'Rasage Clarins',
                                      desc:
                                          "Notre service de rasage Clarins est une gamme de prestation de soins de la peau pour hommes qui aide à préparer la peau pour un rasage confortable et précis",
                                      montant: '2 500 XOF'),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              width: width,
                              height: height * .2,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://1.bp.blogspot.com/-Wof6WRZBbfE/X1OypaHDa9I/AAAAAAAAE5M/XtlK6NvlC6ICUoPDHYSfRuBtjuCFY92rQCLcBGAsYHQ/s2048/apresrasage-clarins.jpg',
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
                                              'Rasage Clarins',
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
                                              '2 500 XOF',
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
                                          'https://www.deepnature.fr/chamonix-spa-by-clarins/1615/soin-energisant-peau-neuve-chamonix.jpg',
                                      title: 'Rasage Clinique',
                                      desc:
                                          "Notre service de rasage Clinique est une gamme de service de soins de la peau pour hommes qui aident à préparer la peau pour un rasage confortable et précis.",
                                      montant: '2 500 XOF'),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              width: width,
                              height: height * .2,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://www.deepnature.fr/chamonix-spa-by-clarins/1615/soin-energisant-peau-neuve-chamonix.jpg',
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
                                              'Rasage Clinique',
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
                                              '2 500 XOF',
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
                                          'https://www.clarins.fr/on/demandware.static/-/Library-Sites-clarins-v3/default/dwe719be56/content/Beauty-School-2021/img/videos/video-31.png',
                                      title: 'Rasage poudre magique',
                                      desc:
                                          "Notre de service rasage à la poudre magique est une prestation de rasage alternative qui implique l'utilisation d'une poudre spéciale au lieu de la mousse à raser traditionnelle.",
                                      montant: '2 500 XOF'),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              width: width,
                              height: height * .2,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://www.clarins.fr/on/demandware.static/-/Library-Sites-clarins-v3/default/dwe719be56/content/Beauty-School-2021/img/videos/video-31.png',
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
                                              'Rasage poudre magique',
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
                                              '2 500 XOF',
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
                                          'https://i0.wp.com/www.lhommetendance.fr/wp-content/uploads/2021/01/mousse-raser-homme.jpg?fit=750%2C500&ssl=1',
                                      title: 'Rasage mousse',
                                      desc:
                                          "Notre service de rasage à la mousse est une prestation courante de préparation de la peau pour un rasage en douceur. ",
                                      montant: '2 500 XOF'),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              width: width,
                              height: height * .2,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://i0.wp.com/www.lhommetendance.fr/wp-content/uploads/2021/01/mousse-raser-homme.jpg?fit=750%2C500&ssl=1',
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
                                              'Rasage mousse',
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
                                              '2 500 XOF',
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
                                          'https://www.futura-sciences.com/maison/comparatifs/wp-content/uploads/2020/04/comparatif-rasoirs-electriques.jpg',
                                      title: 'Rasage électrique',
                                      desc:
                                          "Notre service de rasage électrique est une prestation de rasage qui consiste à utiliser une tondeuse électrique pour couper les poils de la barbe et les cheveux. ",
                                      montant: '2 500 XOF'),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              width: width,
                              height: height * .2,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://www.futura-sciences.com/maison/comparatifs/wp-content/uploads/2020/04/comparatif-rasoirs-electriques.jpg',
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
                                              'Rasage électrique',
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
                                              '2 500 XOF',
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
