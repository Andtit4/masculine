import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: width * .2,
                    height: 1,
                    color: Colors.black,
                  )
                ],
              ),
              Text(
                'vos rendez-vous',
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.bold),
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
                    border: Border.all(width: .1, color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.message),
                            Text(
                              ' TE-025514',
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Text(
                              'Amide Yaya',
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              '24/03/2023',
                              style: GoogleFonts.poppins(),
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
                            Icon(Icons.supervised_user_circle),
                            Text(
                              'Soin visage',
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.history),
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
                            Icon(Icons.monetization_on_rounded),
                            Text(
                              ' 15 000 XOF',
                              style: GoogleFonts.poppins(),
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
