import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';

class MassagePage extends StatefulWidget {
  const MassagePage({super.key});

  @override
  State<MassagePage> createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
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
                                'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                                          'Massage',
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
                                          'https://www.spa-autourdesoi.fr/wp-content/uploads/2019/07/massage-dos-revitalisant.jpg',
                                      title: 'Massage dos 15 min',
                                      desc:
                                          "Notre service de massage du dos est une technique de massage qui se concentre sur les muscles du dos, du cou et des épaules pour soulager la tension musculaire et réduire la douleur.",
                                      montant: '10 000 XOF'),
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
                                    'https://www.spa-autourdesoi.fr/wp-content/uploads/2019/07/massage-dos-revitalisant.jpg',
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
                                              'Massage dos 15 min',
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
                                          'https://img.freepik.com/photos-premium/homme-beneficiant-massage-relaxant-du-dos-spa_562687-1244.jpg?w=1380',
                                      title: 'Massage 30min',
                                      desc:
                                          "Notre service de massage est une technique de manipulation des tissus mous du corps pour aider à soulager la tension musculaire, la douleur et le stress, ainsi qu'à améliorer la circulation sanguine et lymphatique. ",
                                      montant: '15 000 XOF'),
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
                                    'https://img.freepik.com/photos-premium/homme-beneficiant-massage-relaxant-du-dos-spa_562687-1244.jpg?w=1380',
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
                                              'Massage 30min',
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
                                              '15 000 XOF',
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
                                          'https://thumbs.dreamstime.com/z/le-jeune-homme-profitant-du-dos-et-massage-shouders-dans-masseur-de-docteurs-spaprofessional-un-patient-les-jeunes-hommes-corps-169847770.jpg',
                                      title: 'Gommage corps',
                                      desc:
                                          "Notre service de gommage corporel est une technique d'exfoliation de la peau qui consiste à éliminer les cellules mortes de la surface de la peau pour révéler une peau plus douce et plus lisse.",
                                      montant: '30 000 XOF'),
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
                                    'https://thumbs.dreamstime.com/z/le-jeune-homme-profitant-du-dos-et-massage-shouders-dans-masseur-de-docteurs-spaprofessional-un-patient-les-jeunes-hommes-corps-169847770.jpg',
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
                                              'Gommage corps',
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
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DescribePage(
                                      img:
                                          'https://img.static-rmg.be/a/view/q75/w1092/h615/1795498/conseils-massage-jpg.jpg',
                                      title: 'Massage 1h',
                                      desc:
                                          "Notre service de massage est une technique de manipulation des tissus mous du corps pour aider à soulager la tension musculaire, la douleur et le stress, ainsi qu'à améliorer la circulation sanguine et lymphatique. ",
                                      montant: '25 000 XOF'),
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
                                    'https://img.static-rmg.be/a/view/q75/w1092/h615/1795498/conseils-massage-jpg.jpg',
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
                                              'Massage 1h',
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
                                              '25 000 XOF',
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
                                          'https://www.retrouver-son-equilibre.com/wp-content/uploads/2021/02/Deep-Tissue-massage@2x.jpg',
                                      title: 'Massage dep-tissus',
                                      desc:
                                          "Notre service de massage des tissus profonds est une technique de massage qui vise à soulager la douleur et la tension musculaire en ciblant les couches profondes des muscles, des tendons et des fascias. ",
                                      montant: '30 000 XOF'),
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
                                    'https://www.retrouver-son-equilibre.com/wp-content/uploads/2021/02/Deep-Tissue-massage@2x.jpg',
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
                                              'Massage dep-tissus',
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
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DescribePage(
                                      img:
                                          'http://massage-homme-paris14.fr/wp-content/uploads/2015/05/massage-4-mains-300x200.jpg',
                                      title: 'Massage 4 mains',
                                      desc:
                                          "Notre service de massage 4 mains, également connu sous le nom de massage synchronisé, est une technique de massage où deux thérapeutes travaillent en tandem pour masser le corps d'une personne.",
                                      montant: '40 000 XOF'),
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
                                    'http://massage-homme-paris14.fr/wp-content/uploads/2015/05/massage-4-mains-300x200.jpg',
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
                                              'Massage 4 mains',
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
                                              '40 000 XOF',
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
                                          'https://www.masculin.com/wp-content/uploads/sites/2/2013/07/shutterstock_2036999507-1568x1029.jpg',
                                      title: 'Massage pierre chaude',
                                      desc:
                                          "Notre service de massage aux pierres chaudes est une technique de massage qui utilise des pierres chaudes pour soulager la tension musculaire et améliorer la circulation sanguine. ",
                                      montant: '30 000 XOF'),
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
                                    'https://www.masculin.com/wp-content/uploads/sites/2/2013/07/shutterstock_2036999507-1568x1029.jpg',
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
                                              'Massage pierre chaude',
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
