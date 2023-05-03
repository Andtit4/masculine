import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/categorie.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/screens/cat_2/soins_des_pied.dart';

class ServiceDame extends StatefulWidget {
  final String? sexe;
  const ServiceDame({super.key, this.sexe});

  @override
  State<ServiceDame> createState() => _ServiceDameState();
}

class _ServiceDameState extends State<ServiceDame> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  StreamController<List<CategorieModel>> _streamControllerCategorie =
      StreamController<List<CategorieModel>>();

  void fetchCategories() async {
    try {
      final List<CategorieModel> categorie =
          await Api().getCategoryBySex(widget.sexe);
      _streamControllerCategorie.add(categorie);
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                              'https://4.bp.blogspot.com/-IraIQMMHl8E/XDOM-fAK3vI/AAAAAAAD5kU/-8G3SJbV7GQl6OWGwXODNYcNzRIOkvY_ACLcBGAs/w1200-h630-p-k-no-nu/gommage-visage-grains-avis-comment-pourquoi-ne-pas-utiliser.jpg',
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
                                  Text(
                                    'Découvrez dès maintenant notre liste de soins et laissez-vous chouchouter par nos experts de la beauté.',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white),
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
                    StreamBuilder(
                      stream: _streamControllerCategorie.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError)
                          return Text(
                            'An error occurred ${snapshot.error}',
                            style: GoogleFonts.poppins(color: Colors.white),
                          );
                        List<CategorieModel> data = snapshot.data ?? [];
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
                                                () => SoinsDuVisageWoman(
                                                    img: data[index]
                                                        .img_categorie
                                                        .toString(),
                                                    title: data[index]
                                                        .titre_categorie
                                                        .toString(),
                                                    genre: widget.sexe),
                                                duration:
                                                    Duration(milliseconds: 500),
                                                transition:
                                                    Transition.leftToRight);
                                          },
                                          child: Container(
                                            width: width,
                                            height: height * .2,
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent),
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                Image.network(
                                                  data[index]
                                                      .img_categorie
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                                Container(
                                                  width: width,
                                                  height: height * .8,
                                                  padding: EdgeInsets.all(
                                                      width * .04),
                                                  decoration: BoxDecoration(
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
                                                            'Service',
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
                                                            margin:
                                                                EdgeInsets.only(
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
                                                            data[index]
                                                                .titre_categorie
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
                                () => SoinsDuVisageWoman(
                                      img:
                                          'https://images.pexels.com/photos/1204473/pexels-photo-1204473.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                      title: 'Soin de pieds / mains',
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
                                            'Service',
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
                                            'Soin de pieds / mains',
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
                                () => SoinsDuPiedWoman(
                                      img:
                                          "https://images.pexels.com/photos/6001507/pexels-photo-6001507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                      title: 'Soin du visages',
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
                                            'Service',
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
                                            'Soin du visage',
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
                            Get.to(() => MassageWomanPage(),
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
                                            'Service',
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
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => EpilationWomanPage(
                                    img:
                                        "https://www.secretdesenteurs.com/661-large_default/epilation-femme.jpg",
                                    title: "Epilation"),
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
                                  'https://www.secretdesenteurs.com/661-large_default/epilation-femme.jpg',
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
                                            'Service',
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
                                            'Epilation',
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
          ]),
        ),
      ),
    );
  }
}
