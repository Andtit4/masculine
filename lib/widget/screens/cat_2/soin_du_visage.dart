import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';
import 'package:masculine/widget/screens/cat_1/soins_des_pieds.dart';

class SoinsDuPiedWoman extends StatefulWidget {
  final String img;
  final String title;

  const SoinsDuPiedWoman({super.key, required this.img, required this.title});

  @override
  State<SoinsDuPiedWoman> createState() => _SoinsDuPiedWomanState();
}

class _SoinsDuPiedWomanState extends State<SoinsDuPiedWoman> {
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
                                  widget.title,
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
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => DescribePage(
                                    img:
                                        'https://www.consoglobe.com/wp-content/uploads/2020/05/gommage-visage-maison_1718732656_ban.jpg',
                                    title: 'Soins visage gommage simple ',
                                    desc:
                                        "Notre service de soins du visage avec un gommage est une méthode que nous utilisons pour éliminer les cellules mortes de la peau et favoriser le renouvellement cellulaire.",
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
                                'https://www.consoglobe.com/wp-content/uploads/2020/05/gommage-visage-maison_1718732656_ban.jpg',
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
                                        'https://cache.magazine-avantages.fr/data/photo/w1000_ci/5f/vrai_faux_gommage-visage_bons_reflexes_soin_peau_teint.jpg',
                                    title: 'Soins visage revitalisant',
                                    desc:
                                        "otre service de soins du visage revitalisants est une méthode que nous utilisons pour rafraîchir et tonifier la peau tout en lui redonnant de l'éclat. Ces soins du visage visent à stimuler la circulation sanguine et à oxygéner les cellules de la peau pour améliorer la texture, la fermeté et l'apparence générale du visage",
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
                                'https://cache.magazine-avantages.fr/data/photo/w1000_ci/5f/vrai_faux_gommage-visage_bons_reflexes_soin_peau_teint.jpg',
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
                                        'https://naturdermcosmetics.com/wp-content/uploads/2021/06/gommage-image-1.jpg',
                                    title: 'Soins purifiant',
                                    desc:
                                        "Notre service de soins du visage purifiants est une méthode que nous utilisons pour nettoyer en profondeur la peau, éliminer les impuretés et réduire les pores dilatés. Ces soins du visage visent à éliminer les toxines, l'excès de sébum et les cellules mortes de la peau qui peuvent causer des problèmes de peau tels que l'acné, les points noirs et les boutons.",
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
                                'https://naturdermcosmetics.com/wp-content/uploads/2021/06/gommage-image-1.jpg',
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
                                        'https://trucmania.ouest-france.fr/wp-content/uploads/2021/01/Gommage-maison.jpg',
                                    title: 'Soins anti-âge',
                                    desc:
                                        "Notre service de soins du visage anti-âge est une méthode que nous utilisons pour réduire les signes du vieillissement tels que les rides, les ridules et le relâchement cutané. Ces soins du visage visent à stimuler la production de collagène et d'élastine dans la peau, ce qui peut aider à améliorer sa texture, son élasticité et sa fermeté.",
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
                                'https://trucmania.ouest-france.fr/wp-content/uploads/2021/01/Gommage-maison.jpg',
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
