import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/otp.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late bool showProgress = false;
  late String verID = "";

  TextEditingController telController = new TextEditingController();

  authenticate() async {
    var _telController;
    setState(() {
      _telController = '+228${telController.text}';
    });
    print('gtgg$_telController');

    var data = await Api().alreadyExiste(telController.text);
    print('_____$data');

    if (data != 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('tel_key', telController.text);
      Get.offAll(() => BottomNavBar(
            telephoneuser: telController.text,
          ));

      /* Get.offAll(() => PayementScreen(
            data: widget.data,
            heure_debut: widget.heure_debut,
            heure_fin: widget.heure_fin,
          )); */
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.setSettings(appVerificationDisabledForTesting: true);
      await auth.verifyPhoneNumber(
          phoneNumber: _telController,
          verificationCompleted: (PhoneAuthCredential credential) {
            showSnackBarText('Auth Completed!');
          },
          verificationFailed: (FirebaseAuthException e) {
            showSnackBarText('Auth failed!');
            setState(() {
              showProgress = false;
            });
          },
          codeSent: (String verificationId, int? resendToken) {
            verID = verificationId;
            showSnackBarText('OTP Send');
            Get.to(() => OtpPage(
                  verId: verID,
                  telephoneuser: telController.text,
                ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    }
    // print("${data[0]['nb']}");

/*    */
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
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        telController.text = "";
                      });
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
                'Entrez votre\nnuméro de téléphone',
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
                  "Pour continuer votre rendez-vous veuillez vous authentifier",
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
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          )
                        ],
                      ),
                      TiInput(
                          color: Color.fromARGB(94, 46, 46, 46),
                          hintText: '',
                          height: height * .08,
                          icon: '+225',
                          inputController: telController,
                          keyboardType: TextInputType.phone,
                          border: Border.all(width: .1, color: Colors.white),
                          readonly: false,
                          width: width * .9)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showProgress = true;
                  });
                  authenticate();
                },
                child: showProgress == true
                    ? Container(
                        width: width * .9,
                        height: height * .08,
                        color: Color.fromARGB(94, 46, 46, 46),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.white,
                          ),
                        ))
                    : Container(
                        width: width * .9,
                        height: height * .08,
                        color: Color.fromARGB(94, 46, 46, 46),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Connexion',
                              style: GoogleFonts.poppins(color: Colors.white),
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

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white),
    )));
  }
}
