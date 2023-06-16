import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceClient extends StatefulWidget {
  const ServiceClient({super.key});

  @override
  State<ServiceClient> createState() => _ServiceClientState();
}

class _ServiceClientState extends State<ServiceClient> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  call(phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  sms(phoneNumber, content) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('$content'),
      },
    );
    await launchUrl(smsLaunchUri);
  }

  mail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'email@example.com',
      query:
          'subject=App Feedback&body=App Version 3.23', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height * .04,
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
                    'Service Client',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
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
              height: height * .02,
            ),
            Center(
              child: SizedBox(
                width: width * .5,
                height: height * .15,
                child: Image.asset('assets/support.png'),
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() => ServiceClient());
                  // Vibration.vibrate(amplitude: 30, duration: 30);
                  call('+22391913939');
                },
                child: Container(
                  width: double.infinity,
                  height: height * .07,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(94, 46, 46,
                          46) /* borderRadius: BorderRadius.circular(25) */
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nous contacter par appel',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        const Icon(Icons.call, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() => ServiceClient());
                  // Vibration.vibrate(amplitude: 30, duration: 30);
                  sms('+22391913939', "J'aimerais avoir plus d'information pour la prise de rendez-vous");
                },
                child: Container(
                  width: double.infinity,
                  height: height * .07,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(94, 46, 46,
                          46) /* borderRadius: BorderRadius.circular(25) */
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nous contacter par sms',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        const Icon(Icons.sms, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() => ServiceClient());
                  // Vibration.vibrate(amplitude: 30, duration: 30);
                  Send().launchWhatsApp('+22391913939', "J'aimerais avoir plus d'information pour la prise de rendez-vous");
                },
                child: Container(
                  width: double.infinity,
                  height: height * .07,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(94, 46, 46,
                          46) /* borderRadius: BorderRadius.circular(25) */
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nous contacter par whatsapp',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        const Icon(Icons.call, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  mail();
                },
                child: Container(
                  width: double.infinity,
                  height: height * .07,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(94, 46, 46,
                          46) /* borderRadius: BorderRadius.circular(25) */
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nous contacter par mail',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        const Icon(Icons.mail, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Center(
              child: Text(
                '©Copyright Masculine',
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
    /* return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: width * .2,
                    height: height * .05,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
              Text(
                'Service Client',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  width: width * .2,
                  height: height * .08,
                  decoration: BoxDecoration(
                      /* border: Border.all(width: 1, color: Colors.white) */),
                  child: Center(child: Image.asset("assets/logo1.png")))
            ],
          ),
          SizedBox(
            height: height * .04,
          ),
          /* Text(
            'Support',
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ), */
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => ServiceClient());
                // Vibration.vibrate(amplitude: 30, duration: 30);
                call('98418900');
              },
              child: Container(
                width: double.infinity,
                height: height * .07,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(94, 46, 46,
                        46) /* borderRadius: BorderRadius.circular(25) */
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nous contacter par appel',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const Icon(Icons.call, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => ServiceClient());
                // Vibration.vibrate(amplitude: 30, duration: 30);
                sms('98418900', "J'aimerais blablabla");
              },
              child: Container(
                width: double.infinity,
                height: height * .07,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(94, 46, 46,
                        46) /* borderRadius: BorderRadius.circular(25) */
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nous contacter par sms',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const Icon(Icons.sms, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => ServiceClient());
                // Vibration.vibrate(amplitude: 30, duration: 30);
                Send().launchWhatsApp('+22898418900', "J'aimerais blablabla");
              },
              child: Container(
                width: double.infinity,
                height: height * .07,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(94, 46, 46,
                        46) /* borderRadius: BorderRadius.circular(25) */
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nous contacter par whatsapp',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const Icon(Icons.call, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => ServiceClient());
                // Vibration.vibrate(amplitude: 30, duration: 30);
                // Send().launchWhatsApp('+22898418900', "J'aimerais blablabla");
                mail();
              },
              child: Container(
                width: double.infinity,
                height: height * .07,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(94, 46, 46,
                        46) /* borderRadius: BorderRadius.circular(25) */
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nous contacter par mail',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const Icon(Icons.mail, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Center(
            child: Text(
              '©Copyright Masculine',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          )
        ],
      ),
    ); */
  }
}
