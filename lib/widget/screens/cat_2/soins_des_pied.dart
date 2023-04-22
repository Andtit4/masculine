import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/service.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';
import 'package:masculine/widget/screens/cat_1/soins_des_pieds.dart';

class SoinsDuVisageWoman extends StatefulWidget {
  final String img;
  final String title;
  final String? genre;
  const SoinsDuVisageWoman(
      {super.key, required this.img, required this.title, this.genre});

  @override
  State<SoinsDuVisageWoman> createState() => _SoinsDuVisageWomanState();
}

class _SoinsDuVisageWomanState extends State<SoinsDuVisageWoman> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  StreamController<List<ServiceModel>> _streamControllerCategorie =
      StreamController<List<ServiceModel>>();

  void fetchCategories() async {
    try {
      final List<ServiceModel> categorie =
          await Api().getServiceByCategory(widget.title, widget.genre);
      _streamControllerCategorie.add(categorie);
      print(widget.genre);
    } catch (e) {
      _streamControllerCategorie.addError(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();
  }

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
                height: height * .02,
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
                        height: height * .05,
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
                height: height * .01,
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
                      StreamBuilder(
                        stream: _streamControllerCategorie.stream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError)
                            return Text(
                              'An error occurred ${snapshot.error}',
                              style: GoogleFonts.poppins(color: Colors.white),
                            );
                          List<ServiceModel> data = snapshot.data ?? [];
                          print('Data_length_${data.length}');

                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Text(
                                'Not connected to the stream or null',
                                style: GoogleFonts.poppins(color: Colors.white),
                              );
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              );
                            case ConnectionState.active:
                              return SizedBox(
                                width: width,
                                height: height * .4,
                                child: data.length == 0
                                    ? Center(
                                        child: Text(
                                          'Aucune donnée',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: data.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => DescribePage(
                                                        img:
                                                            data[index].img_url.toString(),
                                                        title:
                                                            data[index].title.toString(),
                                                        desc:
                                                            data[index].description.toString(),
                                                        montant: data[index].montant.toString(),
                                                            data: data[index]

                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  transition:
                                                      Transition.leftToRight);
                                              /* Get.to(
                                  () => SoinsDesPieds(
                                      img:
                                          data[index].img_categorie.toString(),
                                      title: data[index].titre_categorie.toString(), genre: widget.sexe),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight); */
                                            },
                                            child: Container(
                                              width: width,
                                              height: height * .2,
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Stack(
                                                fit: StackFit.expand,
                                                children: [
                                                  Image.network(
                                                    data[index]
                                                        .img_url
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Container(
                                                    width: width,
                                                    height: height * .8,
                                                    padding: EdgeInsets.all(
                                                        width * .04),
                                                    decoration: const BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [
                                                          Colors.black,
                                                          Colors.transparent
                                                        ],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter)),
                                                    child: Column(
                                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              data[index]
                                                                  .title
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            Container(
                                                              width: width * .1,
                                                              height: 1,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                left: 10,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              data[index]
                                                                  .montant
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              );

                            default:
                              return Text('');
                          }
                        },
                      )
                      /* Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DescribePage(
                                        img:
                                            'https://dl-file.cyberlink.com/web/upload-file/learning-center/fra/2022/7/Thumbnail_20220726190716546.jpg',
                                        title: 'Retouche des mains',
                                        desc:
                                            "Notre service de retouche des mains consiste à rafraîchir et à entretenir l'apparence des ongles et des cuticules. ",
                                        montant: '2 500 XOF',
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
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://dl-file.cyberlink.com/web/upload-file/learning-center/fra/2022/7/Thumbnail_20220726190716546.jpg',
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
                                              'Retouche des mains',
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
                                            'https://images.pexels.com/photos/6975473/pexels-photo-6975473.jpeg?auto=compress&cs=tinysrgb&w=1600',
                                        title: 'Retouche pied',
                                        desc:
                                            "Notre service de retouche des pieds consiste à rafraîchir et à entretenir l'apparence des ongles et des pieds ",
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
                                    'https://images.pexels.com/photos/6975473/pexels-photo-6975473.jpeg?auto=compress&cs=tinysrgb&w=1600',
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
                                              'Retouche pied',
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
                                            'https://www.kit-manucure.com/modules/xipblog/img/large-french-manucure.jpg',
                                        title: 'Manucure',
                                        desc:
                                            "Notre service de manucure est un traitement de beauté pour les mains et les ongles, qui consiste en plusieurs étapes pour nettoyer, façonner, polir, hydrater et embellir les ongles.",
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
                                    'https://www.kit-manucure.com/modules/xipblog/img/large-french-manucure.jpg',
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
                                              'Manucure',
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
                                            'https://www.mariefrance.fr/wp-content/uploads/sites/5/2022/08/88-750x394.jpg',
                                        title: 'Vernis Pieds et Mains',
                                        desc:
                                            "Notre service consiste à Mettre du vernis sur les pieds et les mains. C’est en fait un moyen facile et amusant de donner une touche de couleur et de style à votre apparence.",
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
                                    'https://www.mariefrance.fr/wp-content/uploads/sites/5/2022/08/88-750x394.jpg',
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
                                              'Vernis Pieds et Mains',
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
                                            'https://cdn.shopify.com/s/files/1/0197/4206/4702/products/pedicure_enfant_500x_92ae32b3-5ca8-4c86-9544-bd64fc04540c.jpg?v=1639791968',
                                        title: 'Pedicure enfant',
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
                                    'https://cdn.shopify.com/s/files/1/0197/4206/4702/products/pedicure_enfant_500x_92ae32b3-5ca8-4c86-9544-bd64fc04540c.jpg?v=1639791968',
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
                                              'Pedicure enfant',
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
                                            'https://thumbs.dreamstime.com/z/manucure-blanche-rose-du-s-d-enfants-84846834.jpg',
                                        title: 'Manucure enfant',
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
                                    'https://thumbs.dreamstime.com/z/manucure-blanche-rose-du-s-d-enfants-84846834.jpg',
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
                                              'Manucure enfant',
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
                                            'https://m1.quebecormedia.com/emp/emp/cd012e4d33141a3de962eb672b4ad66244fa187f-6479-424a-b9bb-bae9529618a8_ORIGINAL.jpg?impolicy=crop-resize&x=0&y=0&w=0&h=0&width=1850',
                                        title: 'French manucure',
                                        desc:
                                            "Notre service French Manucure est une technique de manucure qui consiste à donner un aspect naturel et élégant aux ongles en combinant un vernis à ongles blanc avec une base rose pâle ou nude. ",
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
                                    'https://m1.quebecormedia.com/emp/emp/cd012e4d33141a3de962eb672b4ad66244fa187f-6479-424a-b9bb-bae9529618a8_ORIGINAL.jpg?impolicy=crop-resize&x=0&y=0&w=0&h=0&width=1850',
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
                                              'French manucure',
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
                                            'https://www.obsessio-nails.fr/modules/xipblog/img/large-protocole-capsule.jpg',
                                        title: 'Pose capsule',
                                        desc:
                                            "Notre service de pose de capsule est une technique de manucure qui consiste à ajouter des extensions en plastique ou en acrylique sur les ongles naturels afin de créer une surface plus large pour appliquer du vernis à ongles ou pour ajouter de la longueur aux ongles.",
                                        montant: '7 500 XOF',
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
                                    'https://www.obsessio-nails.fr/modules/xipblog/img/large-protocole-capsule.jpg',
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
                                              'Pose capsule',
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
                                              '7 500 XOF',
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
                                            'https://www.santeplusmag.com/wp-content/uploads/manicure-pedicure-maison.jpg',
                                        title: 'Pédicure',
                                        desc:
                                            "Notre service de pédicure est un traitement de beauté pour les pieds et les ongles, qui consiste en plusieurs étapes pour nettoyer, façonner, polir, hydrater et embellir les ongles des pieds.",
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
                                    'https://www.santeplusmag.com/wp-content/uploads/manicure-pedicure-maison.jpg',
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
                          SizedBox(
                            height: height * .03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DescribePage(
                                        img:
                                            'https://www.santeplusmag.com/wp-content/uploads/manicure-pedicure-maison.jpg',
                                        title: 'Vernis Permanent',
                                        desc:
                                            "Notre service de vernis à ongles permanent, également connu sous le nom de vernis semi-permanent, est une technique de manucure qui utilise un vernis spécial et une lampe LED ou UV pour durcir le vernis",
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
                                    'https://www.santeplusmag.com/wp-content/uploads/manicure-pedicure-maison.jpg',
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
                                              'Vernis Permanent',
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
                                            'https://3.bp.blogspot.com/-vuzE2JCw30s/WaAHVZucTuI/AAAAAAAAF2Q/RGA8P-9WcgAEQ6KAWSXnHRzME0f4GjeiwCLcBGAs/s1600/b_20150806_13_37_37_RET_blog-1.jpg',
                                        title: 'Gel',
                                        desc:
                                            "Notre service de vernis à ongles permanent, également connu sous le nom de vernis semi-permanent, est une technique de manucure qui utilise un vernis spécial et une lampe LED ou UV pour durcir le vernis",
                                        montant: '20 000 XOF',
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
                                    'https://3.bp.blogspot.com/-vuzE2JCw30s/WaAHVZucTuI/AAAAAAAAF2Q/RGA8P-9WcgAEQ6KAWSXnHRzME0f4GjeiwCLcBGAs/s1600/b_20150806_13_37_37_RET_blog-1.jpg',
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
                                              'Gel',
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
                        ],
                      ) */
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
