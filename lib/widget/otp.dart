import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/login.dart';
import 'package:masculine/widget/partials/input.dart';
import 'package:masculine/widget/screens/complete.dart';

class OtpPage extends StatefulWidget {
  final String verId;
  final String? telephoneuser;
  final LoginPage data;
  const OtpPage(
      {super.key,
      required this.verId,
      required this.telephoneuser,
      required this.data});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  late String tel = "";

  TextEditingController otpControler = new TextEditingController();

  Future<void> verifyOtp() async {
    // Api().alreadyExiste();

    print('start');
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: widget.verId, smsCode: otpControler.text))
        .whenComplete(() async {
      showSnackBarText('Code de confirmation vérifié');
      print(widget.telephoneuser);

      tel = await widget.telephoneuser.toString();

      // Api().alreadyExiste(widget.telephoneuser);
      // print('ççççç___çççç${widget.verId}');
      Get.offAll(() => CompletePage(data: widget.telephoneuser, data1: widget));
      // Api().initializeEndPoint(middlware, endpoint)
    });
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
                        otpControler.text = "";
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
                'Entrez votre\ncode de confirmation',
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
                  "Veuillez entrer le code de vérification",
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
                          icon: '',
                          inputController: otpControler,
                          keyboardType: TextInputType.phone,
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
                  /* authenticate(); */
                  verifyOtp();
                },
                child: Container(
                  width: width * .9,
                  height: height * .08,
                  color: Color.fromARGB(94, 46, 46, 46),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vérifier',
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
