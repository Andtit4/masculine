import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key, String? telephoneuser});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
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
                height: height * .04,
              ),
              Row(
                children: [
                  Text(
                    'Masculine ',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    width: width * .2,
                    height: 1,
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                'vos rendez-vous',
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                width: double.infinity,
                height: height * .15,
                padding: EdgeInsets.all(15),
                // color: Colors.black,
                decoration: BoxDecoration(
                    border: Border.all(width: .1, color: Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.message, color: Colors.white),
                            Text(
                              ' TE-025514',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.white),
                            Text(
                              'Amide Yaya',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month, color: Colors.white),
                            Text(
                              '24/03/2023',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.supervised_user_circle,
                                color: Colors.white),
                            Text(
                              'Soin visage',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.history, color: Colors.white),
                            Container(
                              // margin: EdgeInsets.only(left: 20),
                              child: Text(
                                '  En attente',
                                style: GoogleFonts.poppins(color: Colors.green),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on_rounded,
                                color: Colors.white),
                            Text(
                              ' 15 000 XOF',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
