import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';

class EpilationPage extends StatefulWidget {
  const EpilationPage({super.key});

  @override
  State<EpilationPage> createState() => _EpilationPageState();
}

class _EpilationPageState extends State<EpilationPage> {
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
              Container(
                  width: width,
                  height: height * .3,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://cdn0.mariages.net/article-vendor/1041/3_2/960/jpg/cire-dos-homme_3_221041-159448283085415.jpeg',
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
                                  'Epilation',
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
                color: Colors.white,
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
                      SizedBox(
                        height: height * .03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => DescribePage(
                                  img:
                                      'https://www.spa-autourdesoi.fr/wp-content/uploads/2019/07/massage-dos-revitalisant.jpg',
                                  title: 'Epilation sourcils',
                                  desc:
                                      "Notre service d’épilation des sourcils est une technique de soins de beauté qui consiste à épiler les poils indésirables de la région des sourcils pour façonner et définir les sourcils",
                                  montant: '3 000 XOF'),
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
                                          'Epilation sourcils',
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
                                          '3 000 XOF',
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
                                      'https://www.charlotted.fr/img/box-epilation-homme.jpg',
                                  title: 'Epilation Aisselles',
                                  desc:
                                      "Notre service d’épilation des aisselles est une technique de soins de beauté qui consiste à éliminer les poils indésirables de la zone des aisselles pour créer une apparence plus lisse et plus propre.",
                                  montant: '5 000 XOF'),
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
                                'https://www.charlotted.fr/img/box-epilation-homme.jpg',
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
                                          'Epilation Aisselles',
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
                                      'https://assets.afcdn.com/story/20211202/2150321_w2119h1589c1cx1060cy707cxt0cyt0cxb2119cyb1414.jpg',
                                  title: 'Epilation Visage',
                                  desc:
                                      "Notre service d’épilation du visage est une technique de soins de beauté qui consiste à éliminer les poils indésirables de la zone du visage pour créer une apparence plus lisse et plus propre.",
                                  montant: '10 000 XOF'),
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
                                'https://assets.afcdn.com/story/20211202/2150321_w2119h1589c1cx1060cy707cxt0cyt0cxb2119cyb1414.jpg',
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
                                          'Epilation Visage',
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
                      /* GestureDetector(
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
                          decoration: BoxDecoration(color: Colors.transparent),
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
                          decoration: BoxDecoration(color: Colors.transparent),
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
                          decoration: BoxDecoration(color: Colors.transparent),
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
                          decoration: BoxDecoration(color: Colors.transparent),
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
                      ), */
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
