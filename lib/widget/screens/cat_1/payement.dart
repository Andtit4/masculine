
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayementScreen extends StatefulWidget {
  final DescribePage data;
  final String heure_fin;
  final String heure_debut;
  final String? e;
  final String? poste;
  const PayementScreen(
      {super.key,
      required this.data,
      required this.heure_debut,
      required this.heure_fin,
      this.e,
      required this.poste});

  @override
  State<PayementScreen> createState() => _PayementScreenState();
}

class _PayementScreenState extends State<PayementScreen> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(15),
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
              Container(
                  width: width,
                  height: height * .3,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        widget.data.img,
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
                                  widget.data.title,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Montant',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    widget.data.montant,
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: Color.fromARGB(255, 77, 76, 76)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    widget.data.title,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color.fromARGB(255, 124, 123, 123)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date prévue',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '${widget.heure_debut}',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color.fromARGB(255, 124, 123, 123)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Heure prévue',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '${widget.heure_fin}',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color.fromARGB(255, 124, 123, 123)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Heure du service',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '${widget.data.data.heure_debut}:00 à ${widget.data.data.heure_fin}:00',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color.fromARGB(255, 124, 123, 123)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Poste',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '${widget.poste}',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color.fromARGB(255, 124, 123, 123)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              /* Text(
                'Mode de paiement',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ), */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      Api().insertDemande(
                          widget.data.title,
                          widget.data.desc,
                          widget.data.montant,
                          widget.heure_debut,
                          widget.heure_fin,
                          prefs.getString('tel_key'),
                          'Espece',
                          widget.e.toString(), widget.poste);
                      showSnackBarText(
                          'Votre rendez-vous a bien été envoyé pour le ${widget.heure_debut} à ${widget.heure_fin}');
                      Get.offAll(() => BottomNavBar(
                          telephoneuser: prefs.getString('tel_key')));
                    },
                    child: Container(
                      width: width * .9 ,
                      height: height * .07,
                      margin: EdgeInsets.only(top: height * .04),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Prendre rendez-vous',
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  /* GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      Api().insertDemande(
                          widget.data.title,
                          widget.data.desc,
                          widget.data.montant,
                          widget.heure_debut,
                          widget.heure_fin,
                          prefs.getString('tel_key'),
                          'Mobile money',
                          widget.e, widget.poste);
                      showSnackBarText('Votre rendez-vous a bien été envoyé');
                      Get.offAll(() => BottomNavBar(
                          telephoneuser: prefs.getString('tel_key')));
                    },
                    child: Container(
                      width: width * .4,
                      height: height * .07,
                      margin: EdgeInsets.only(top: height * .04),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Mobile money',
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ), */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white),
    )));
  }
}
