import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PolitiqueSecu extends StatefulWidget {
  const PolitiqueSecu({super.key});

  @override
  State<PolitiqueSecu> createState() => _PolitiqueSecuState();
}

class _PolitiqueSecuState extends State<PolitiqueSecu> {
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
              height: height * .08,
            ),
            Text(
              'Politique de sécurité',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Bienvenue sur notre page de politique de sécurité. Nous prenons la sécurité très au sérieux et nous nous engageons à protéger toutes les données sensibles de nos clients conformément aux meilleures pratiques de l'industrie.",
                  style: GoogleFonts.poppins(color: Colors.white)),
            ),
            Text(
              "1.	Sécurité des données ",
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
            Text(
              "2.	Accès aux données ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "L'accès aux données est limité aux personnes autorisées qui en ont besoin pour effectuer leur travail. Tous les employés et sous-traitants doivent signer un accord de confidentialité et sont formés sur les pratiques de sécurité avant de pouvoir accéder aux données",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "3.	Protection contre les virus et les attaques  ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous utilisons des logiciels antivirus et des pares-feux pour protéger nos systèmes contre les virus et les attaques malveillantes. Nous mettons régulièrement à jour nos logiciels et maintenons nos systèmes à jour pour nous protéger contre les nouvelles menaces.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "4.	Gestion des incidents de sécurité  ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "En cas d'incident de sécurité, nous avons mis en place des protocoles de gestion des incidents pour minimiser l'impact et réduire les risques pour nos clients. Nous avons également des plans de continuité des activités pour garantir que nous pouvons continuer à fournir nos services en cas d'incident.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "5.	Formation des employés ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous formons régulièrement nos employés sur les pratiques de sécurité pour garantir que tous les membres de notre équipe comprennent l'importance de la sécurité et sont en mesure de suivre les meilleures pratiques.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "6.	Évaluation régulière ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous effectuons régulièrement des évaluations de sécurité pour garantir que nos systèmes et pratiques sont à jour et en conformité avec les normes de sécurité de l'industrie.\n\nNous espérons que cette politique de sécurité vous a fourni des informations claires et complètes sur la manière dont nous protégeons vos données. Si vous avez des questions ou des préoccupations concernant notre politique de sécurité, n'hésitez pas à nous contacter.",
                style: GoogleFonts.poppins(color: Colors.white),
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
