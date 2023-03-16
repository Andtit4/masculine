import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'votre compte',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  /* Container(
                    width: width * .1,
                    height: height * .05,
                    // margin: EdgeInsets.only(left: 10),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        '1',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ) */
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                width: width,
                height: height * .8,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Information',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(94, 46, 46,
                                  46) /* borderRadius: BorderRadius.circular(25) */
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Container(
                                width: width * .16,
                                height: height * .05,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 241, 228),
                                    /* borderRadius: BorderRadius.circular(25) */),
                                child: FluIcon(
                                  FluIcons.edit,
                                  style: FluIconStyles.bulk,
                                ),
                              ), */
                                Text(
                                  'Information personnelle',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        'Support',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(94, 46, 46,
                                  46) /* borderRadius: BorderRadius.circular(25) */
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Container(
                                width: width * .16,
                                height: height * .05,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 241, 228),
                                    /* borderRadius: BorderRadius.circular(25) */),
                                child: FluIcon(
                                  FluIcons.edit,
                                  style: FluIconStyles.bulk,
                                ),
                              ), */
                                Text(
                                  'Service Client',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(94, 46, 46,
                                  46) /* borderRadius: BorderRadius.circular(25) */
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /*  Container(
                                width: width * .16,
                                height: height * .05,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 241, 228),
                                    /* borderRadius: BorderRadius.circular(25) */),
                                child: FluIcon(
                                  FluIcons.questionCircleUnicon,
                                  // style: FluIconStyles.bulk,
                                ),
                              ), */
                                Text(
                                  'Comment ça marche',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(94, 46, 46,
                                  46) /* borderRadius: BorderRadius.circular(25) */
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Container(
                                width: width * .16,
                                height: height * .05,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 241, 228),
                                    /* borderRadius: BorderRadius.circular(25) */),
                                /* child: FluIcon(
                                  FluIcons.quoteUpSquare,
                                  style: FluIconStyles.bulk,
                                ), */
                              ), */
                                Text(
                                  'FAQ',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(94, 46, 46,
                                  46) /* borderRadius: BorderRadius.circular(25) */
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Container(
                                width: width * .16,
                                height: height * .05,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 241, 228),
                                    /* borderRadius: BorderRadius.circular(25) */),
                                /* child: FluIcon(
                                  FluIcons.quoteUpSquare,
                                  style: FluIconStyles.bulk,
                                ), */
                              ), */
                                Text(
                                  'A propos',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        'Politique',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(94, 46, 46,
                                  46) /* borderRadius: BorderRadius.circular(25) */
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Container(
                                width: width * .16,
                                height: height * .05,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 220, 241, 228),
                                    /* borderRadius: BorderRadius.circular(25) */),
                                child: FluIcon(
                                  FluIcons.edit,
                                  style: FluIconStyles.bulk,
                                ),
                              ), */
                                Text(
                                  'Politique de confidentialité',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Container(
                          width: double.infinity,
                          height: height * .07,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(94, 46, 46,
                                46), /* borderRadius: BorderRadius.circular(25) */
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Politique de sécurité',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      Center(
                        child: Text(
                          '©Copyright Komal Technology',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
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
}
