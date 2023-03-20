import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late bool select = false;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'vos notifications',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    width: width * .1,
                    height: height * .05,
                    // margin: EdgeInsets.only(left: 10),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        '1',
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select = !select;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: height * .18,
                  padding: EdgeInsets.all(15),
                  // color: Colors.black,
                  decoration: BoxDecoration(
                      color: select ? Colors.black : Colors.white,
                      border: Border.all(
                          width: .1,
                          color: select ? Colors.white : Colors.black)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Text(
                              "16/03/2023",
                              style: GoogleFonts.poppins(
                                  color: select ? Colors.white : Colors.black),
                            ),
                            Container(
                              width: width * .1,
                              height: 1,
                              margin: EdgeInsets.only(bottom: 10),
                              color: select ? Colors.white : Colors.black,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.messenger_outline_sharp,
                              color: select ? Colors.white : Colors.black),
                          SizedBox(
                            width: width * .75,
                            child: Text(
                              'Ex consequatur aliquam vitae vel id.Ipsam ipsum laboriosam minus odit tenetur. Delectus nisi voluptatem qui. Officia quasi maiores saepe velit labore veniam consequatur. Molestias accusantium ea corporis libero repellat vero nisi.',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: select ? Colors.white : Colors.black),
                            ),
                          )
                         
                        ],
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
}
