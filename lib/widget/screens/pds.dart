import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PolitiqueS extends StatefulWidget {
  const PolitiqueS({super.key});

  @override
  State<PolitiqueS> createState() => _PolitiqueSState();
}

class _PolitiqueSState extends State<PolitiqueS> {
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
              'Politique de confidentialité',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'Bienvenue sur notre page de politique de confidentialité. Nous prenons la confidentialité et la sécurité de vos données personnelles très au sérieux, et nous nous engageons à protéger vos informations conformément aux lois applicables en matière de protection des données.',
                  style: GoogleFonts.poppins(color: Colors.white)),
            ),
            Text(
              "1. Les types d'informations que nous collectons ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous collectons des informations personnelles telles que votre nom, votre adresse e-mail, votre numéro de téléphone et d'autres informations que vous choisissez de nous fournir lorsque vous utilisez nos services ou interagissez avec nous.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "2.	Comment nous utilisons vos informations ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous utilisons vos informations pour vous fournir nos services, répondre à vos demandes, communiquer avec vous, personnaliser nos services pour répondre à vos besoins, traiter les paiements et améliorer notre application mobile et nos services",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "3.	Comment nous protégeons vos informations ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous prenons des mesures techniques et organisationnelles appropriées pour protéger vos informations contre tout accès, modification, divulgation ou destruction non autorisée.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "4.	Comment nous partageons vos informations ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous ne partageons pas vos informations personnelles avec des tiers, sauf dans les cas où cela est nécessaire pour fournir nos services, pour se conformer à la loi ou pour protéger nos droits, notre propriété ou notre sécurité.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "5.	Vos choix et vos droits ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Vous avez le droit de demander l'accès, la correction, la suppression ou la limitation de l'utilisation de vos informations personnelles. Vous pouvez également vous opposer à l'utilisation de vos informations personnelles à des fins de marketing direct ou demander la portabilité de vos informations personnelles.",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            Text(
              "6.	Modifications de la politique de confidentialité  ",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Nous pouvons mettre à jour cette politique de confidentialité de temps en temps pour refléter les changements dans nos pratiques en matière de confidentialité. Nous vous recommandons de consulter cette page régulièrement pour rester informé de tout changement. Nous espérons que cette politique de confidentialité vous a fourni des informations claires et complètes sur la manière dont nous collectons, utilisons et protégeons vos informations personnelles. Si vous avez des questions ou des préoccupations concernant notre politique de confidentialité, n'hésitez pas à nous contacter.",
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
