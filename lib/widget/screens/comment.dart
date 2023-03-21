import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CCM extends StatefulWidget {
  const CCM({super.key});

  @override
  State<CCM> createState() => _CCMState();
}

class _CCMState extends State<CCM> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .05,
            ),
            Container(
              color: Color.fromARGB(94, 46, 46, 46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                   GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: width * .05,
                        height: height * .08,
                        /* decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)), */
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    'Comment ça marche',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  /*                  Text(
                      "Service pour homme",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ), */
                  SizedBox(),
                  SizedBox()

                  /* Container(
                      width: width * .2,
                      height: height * .08,
                      decoration: BoxDecoration(
                          /* border: Border.all(width: 1, color: Colors.white) */),
                      child: Center(child: Image.asset("assets/logo1.png"))) */
                ],
              ),
            ),
            SizedBox(
              width: width,
              height: height * .9,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 1 : Télécharger l’application ",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Nous utilisons des protocoles de sécurité standard pour protéger vos données contre l'accès non autorisé, la modification ou la divulgation. Toutes les données que vous nous fournissez sont stockées sur des serveurs sécurisés et protégées par des pares-feux et des systèmes de détection d'intrusion.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 2 : Choix du service et de la date",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Vous sélectionnez le service que vous souhaitez réserver, tels qu'une coupe de cheveux, un massage ou une manucure. Ensuite, choisissez une date et une heure qui conviens pour votre rendez-vous.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 3 : Création d'un compte",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Vous devez créer un compte sur l'application pour terminer la prise de rendez-vous en fournissant les informations personnelles, telles que votre nom, adresse e-mail et numéro de téléphone.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 4 : Disponibilité des professionnels",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "L'application vérifie automatiquement la disponibilité des professionnels de votre salon de coiffure et spa. Si un professionnel est disponible à la date et l'heure choisies, vous pouvez prendre le rendez-vous avec ce professionnel du salon.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 5 : Confirmation de la réservation",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Une fois que vous avez sélectionné le service, la date et l'heure, l'application demande une confirmation de réservation. Vous devez confirmer la réservation pour que celle-ci soit prise en compte. En fin vous avez le choix de payer directement via l’application par orange money, Moov Money, par carte bancaire ou soit en espèce le jour du rendez-vous.. ",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 6 : Rappels et notifications",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "L'application vous envoi des rappels de rendez-vous par e-mail ou par SMS pour vous rappeler les rendez-vous à venir.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 6 : Rappels et notifications",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "L'application vous envoi des rappels de rendez-vous par e-mail ou par SMS pour vous rappeler les rendez-vous à venir.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        color: Color.fromARGB(94, 46, 46, 46),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   Etape 7 : Gestion des rendez-vous",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Vous pouvez gérer vos rendez-vous à tout moment à partir de l'application, par exemple en les annulant ou en les modifiant.",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: width * .9,
                          height: height * .06,
                          color: Colors.white,
                          child: Center(
                            child: Text('Fermer',
                                style:
                                    GoogleFonts.poppins(color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .08,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
