import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> with TickerProviderStateMixin {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late bool step_1 = false;
  late bool step_2 = false;
  late bool step_3 = false;
  late bool step_4 = false;
  late bool step_5 = false;
  late bool step_6 = false;

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )
    ..forward()
    ..addListener(() {
      if (_controller.isCompleted) {
        _controller.stop();
      }
    });

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
                  /* SizedBox(
                    height: height * .08,
                  ), */
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: width * .2,
                        height: height * .08,
                        /* decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)), */
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    'Foire aux questions',
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
              height: height * .85,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FadeTransition(
                        opacity: _controller,
                        child: Text(
                            'Bienvenue sur notre page FAQ ! Nous avons rassemblé les questions les plus fréquemment posées par nos clients pour vous fournir des réponses rapides et utiles. Nous espérons que cela vous aidera à mieux comprendre nos services et à résoudre tout problème que vous pourriez rencontrer.',
                            style: GoogleFonts.poppins(color: Colors.white)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step_1 = !step_1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(94, 46, 46, 46),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Q : Quels sont les services que vous offrez ? ",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              step_1 == true
                                  ? FadeTransition(
                                      opacity: _controller,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "R : Nous offrons une gamme complète de services de coiffure, de soins de la peau et de relaxation, y compris des coupes de cheveux, des colorations, des traitements capillaires, des manucures et pédicures, des soins du visage, des massages et plus encore.",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step_2 = !step_2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(94, 46, 46, 46),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Q : Comment puis-je prendre rendez-vous ? ",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              step_2 == true
                                  ? FadeTransition(
                                      opacity: _controller,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "R : Vous pouvez prendre rendez-vous en ligne sur notre application mobile disponible sur App store ou Play store ou en appelant directement notre salon. Nous vous recommandons de prendre rendez-vous à l'avance pour vous assurer que vous obtenez le temps et le service souhaité.",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step_3 = !step_3;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(94, 46, 46, 46),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q : Quels sont vos tarifs ?",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              step_3 == true
                                  ? FadeTransition(
                                      opacity: _controller,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "R : Nos tarifs varient en fonction du service que vous choisissez. Nos tarifs sont disponibles sur l’application ou contacter notre salon pour obtenir plus d'informations sur nos tarifs.",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step_4 = !step_4;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(94, 46, 46, 46),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q : Quels sont vos tarifs ?",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              step_4 == true
                                  ? FadeTransition(
                                      opacity: _controller,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "R : Nos tarifs varient en fonction du service que vous choisissez. Nos tarifs sont disponibles sur l’application ou contacter notre salon pour obtenir plus d'informations sur nos tarifs.",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step_5 = !step_5;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(94, 46, 46, 46),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q : Quels types de produits utilisez-vous ?",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              step_5 == true
                                  ? FadeTransition(
                                      opacity: _controller,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "R : Nous utilisons des produits de haute qualité pour garantir que nos clients obtiennent les meilleurs résultats. Nous utilisons des marques de renom dans l'industrie de la beauté et nous sommes également en mesure de fournir des recommandations et des conseils pour aider nos clients à maintenir leur beauté et leur bien-être à la maison.",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          step_6 = !step_6;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color.fromARGB(94, 46, 46, 46),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q : Quelle est votre politique d'annulation ?",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              step_6 == true
                                  ? FadeTransition(
                                      opacity: _controller,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "R : Nous comprenons que les choses peuvent arriver et que les clients peuvent avoir besoin d'annuler ou de reporter leur rendez-vous. Nous vous demandons de nous informer de toute annulation ou modification de rendez-vous au moins 24 heures à l'avance pour nous permettre de planifier notre emploi du temps. Des frais d'annulation peuvent s'appliquer pour les annulations tardives ou les rendez-vous manqués.\n\nNous espérons que ces réponses vous ont aidé. Si vous avez des questions supplémentaires ou des préoccupations, n'hésitez pas à nous contacter. Nous sommes là pour vous aider !",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .08,
                    ),
                    /* Center(
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
                    ) */
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
                        style: GoogleFonts.poppins(color: Colors.black)),
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
    );
  }
}
