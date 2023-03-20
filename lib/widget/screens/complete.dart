import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/otp.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/input.dart';

class CompletePage extends StatefulWidget {
  final String? data;
  final OtpPage data1;
  const CompletePage({super.key, required this.data, required this.data1});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();

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
              Text(
                'Complètez votre profil',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                width: width * .8,
                child: Text(
                  "Veuillez complèter votre profil pour enregistrer votre premier rendez-vous.",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                width: width * .9,
                height: height * .24,
                color: Color.fromARGB(94, 46, 46, 46),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /*  Text(
                            '+225',
                            style: GoogleFonts.poppins(),
                          ), */

                          Row(
                            children: [
                              SizedBox(
                                width: 46,
                                height: 36,
                                child: Image.network(
                                  'https://www.larousse.fr/encyclopedie/data/images/1009652-Drapeau_de_la_C%C3%B4te_dIvoire.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Text(
                                "Côte d'ivoire",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(),
                          SizedBox(),

                          /* Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ) */
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TiInput(
                              color: Color.fromARGB(94, 46, 46, 46),
                              hintText: '',
                              height: height * .08,
                              icon: 'Nom',
                              inputController: _nomController,
                              keyboardType: TextInputType.name,
                              readonly: false,
                              width: width * .37),
                          TiInput(
                              color: Color.fromARGB(94, 46, 46, 46),
                              hintText: '',
                              height: height * .08,
                              icon: 'Prénom',
                              inputController: _prenomController,
                              keyboardType: TextInputType.name,
                              readonly: false,
                              width: width * .37),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  // authenticate();
                  print(widget.data);
                  Api().insertOtp(
                      _nomController.text, _prenomController.text, widget.data);

                  Api().insertDemande(
                      widget.data1.data.data.title,
                      widget.data1.data.data.desc,
                      widget.data1.data.data.montant,
                      widget.data1.data.heure_debut,
                      widget.data1.data.heure_fin,
                      widget.data1.telephoneuser);
                  showSnackBarText('Votre rendez-vous a bien été envoyé');
                  Get.offAll(() => BottomNavBar(telephoneuser: widget.data1.telephoneuser));
                },
                child: Container(
                  width: width * .9,
                  height: height * .08,
                  color: Color.fromARGB(94, 46, 46, 46),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enregistrer',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
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

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white),
    )));
  }
}
