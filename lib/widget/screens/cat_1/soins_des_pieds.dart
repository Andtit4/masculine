import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';

class SoinsDesPieds extends StatefulWidget {
  final String img;
  final String title;
  const SoinsDesPieds({super.key, required this.img, required this.title});

  @override
  State<SoinsDesPieds> createState() => _SoinsDesPiedsState();
}

class _SoinsDesPiedsState extends State<SoinsDesPieds> {
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
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  /*                  Text(
                    "Service pour homme",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ), */
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
                                          'Soins des mains et des pieds',
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
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DescribePage(
                                        img:
                                            'https://atelierfaitmain.fr/wp-content/uploads/2021/04/Atelier-Fait-Main-_30A9952-%C2%A9TonyGuillou.jpg',
                                        title: 'Retouche des mains ',
                                        desc:
                                            "Notre service de retouche des mains consiste à rafraîchir et à entretenir l'apparence des ongles et des cuticules",
                                        montant: '2 500 XOF',
                                      ),
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
                                    'https://atelierfaitmain.fr/wp-content/uploads/2021/04/Atelier-Fait-Main-_30A9952-%C2%A9TonyGuillou.jpg',
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
                                              'Retouche des mains ',
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
                                            'https://static.wixstatic.com/media/2602bf_1ca899de8ab142a2a79353081db4f313~mv2.jpg/v1/fill/w_706,h_447,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/pedicure.jpg',
                                        title: 'Retouche des pieds',
                                        desc:
                                            "Notre service de retouche des pieds consiste à rafraîchir et à entretenir l'apparence des ongles et des pieds",
                                        montant: '5 000 XOF',
                                      ),
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
                                    'https://static.wixstatic.com/media/2602bf_1ca899de8ab142a2a79353081db4f313~mv2.jpg/v1/fill/w_706,h_447,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/pedicure.jpg',
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
                                              'Retouche des pieds',
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
                                              '5 000 XOF',
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
                                            'https://previews.123rf.com/images/evgenyatamanenko/evgenyatamanenko1709/evgenyatamanenko170900007/85262742-bonne-enfant-dr%C3%B4le-petite-fille-aux-bigoudis-fait-une-p%C3%A9dicure-peint-des-ongles-et-des-rires.jpg',
                                        title: 'Pédicure enfant',
                                        desc:
                                            "Notre service de pédicure pour enfants est un traitement de beauté pour les pieds et les ongles destiné aux enfants.",
                                        montant: '5 000 XOF',
                                      ),
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
                                    'https://previews.123rf.com/images/evgenyatamanenko/evgenyatamanenko1709/evgenyatamanenko170900007/85262742-bonne-enfant-dr%C3%B4le-petite-fille-aux-bigoudis-fait-une-p%C3%A9dicure-peint-des-ongles-et-des-rires.jpg',
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
                                              'Pédicure enfant',
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
                                              '5 000 XOF',
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
                                            'https://www.cdiscount.com/pdt2/3/1/7/1/550x550/auc5699008055317/rw/18-faux-ongles-a-pression-pour-enfants-outil-de.jpg',
                                        title: 'Manicure enfant',
                                        desc:
                                            "Notre service de manucure pour enfants est un traitement de beauté pour les mains et les ongles destiné aux enfants",
                                        montant: '5 000 XOF',
                                      ),
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
                                    'https://www.cdiscount.com/pdt2/3/1/7/1/550x550/auc5699008055317/rw/18-faux-ongles-a-pression-pour-enfants-outil-de.jpg',
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
                                              'Manicure enfant',
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
                                              '5 000 XOF',
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
                                            'https://images.pexels.com/photos/1204473/pexels-photo-1204473.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                        title: 'Manicure',
                                        desc:
                                            "Notre service de manucure est un traitement de beauté pour les mains et les ongles, qui consiste en plusieurs étapes pour nettoyer, façonner, polir, hydrater et embellir les ongles.",
                                        montant: '10 000 XOF',
                                      ),
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
                                    'https://images.pexels.com/photos/1204473/pexels-photo-1204473.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                                              'Manicure',
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
                                              '10 000 XOF',
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
                                            'https://images.pexels.com/photos/1204473/pexels-photo-1204473.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                        desc:
                                            "Notre service de pédicure est un traitement de beauté pour les pieds et les ongles, qui consiste en plusieurs étapes pour nettoyer, façonner, polir, hydrater et embellir les ongles des pieds",
                                        title: 'Pédicure',
                                        montant: '10 000 XOF',
                                      ),
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
                                    'https://images.pexels.com/photos/1204473/pexels-photo-1204473.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                                              'Pédicure',
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
                                              '10 000 XOF',
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
                        ],
                      )
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
