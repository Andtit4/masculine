import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPga extends StatefulWidget {
  const AboutPga({super.key});

  @override
  State<AboutPga> createState() => _AboutPgaState();
}

class _AboutPgaState extends State<AboutPga> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              SizedBox(
                height: height * .08,
              ),
              Text(
                'A propos',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    "A propos Bienvenue à notre salon de coiffure et spa « MASCULINE » ! Nous sommes fiers de vous offrir une expérience de beauté et de détente exceptionnelle. Notre salon est conçu pour offrir une atmosphère luxueuse et relaxante, où nos clients peuvent s'évader du stress quotidien et se sentir choyés. Nous offrons une gamme complète de services de coiffure, de soins de la peau et de relaxation, y compris des coupes de cheveux, des colorations, des traitements capillaires, des manucures et pédicures, des soins du visage, des massages et plus encore. Nous utilisons des produits de haute qualité pour garantir que nos clients obtiennent les meilleurs résultats. Notre personnel est composé de professionnels expérimentés et passionnés qui se consacrent à répondre aux besoins de chaque client individuellement. Nous sommes également en mesure de fournir des conseils et des recommandations pour vous aider à maintenir votre beauté et votre bien-être à la maison. Nous sommes impatients de vous accueillir dans notre salon et de vous offrir une expérience de beauté et de détente incomparable. Réservez dès maintenant votre rendez-vous et laissez-nous vous choyer !",
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
              SizedBox(
                height: height * .08,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width * .9,
                  height: height * .06,
                  color: Colors.white,
                  child: Center(
                    child: Text('Fermer',
                        style: GoogleFonts.poppins(color: Colors.black)),
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
