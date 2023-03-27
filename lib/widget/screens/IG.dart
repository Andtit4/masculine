import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/user.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/partials/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationGenerale extends StatefulWidget {
  late String? telephoneuser;
  InformationGenerale({super.key, this.telephoneuser});

  @override
  State<InformationGenerale> createState() => _InformationGeneraleState();
}

class _InformationGeneraleState extends State<InformationGenerale> {
  late double height = MediaQuery.of(context).size.height;
  late double width = MediaQuery.of(context).size.width;
  late String id = "";
  late String iduser = "";
  late bool showProgress = false;
  late String nom = "";
  late String prenom = "";
  late String tel = "";
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  Timer? timer;

  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tmp = prefs.getString('tel_key');
    setState(() {
      id = tmp!;
    });
    print('___SHOW__THE_WIDGET__${tmp}');
    return await Api().getUser(tmp);
  }

  @override
  void initState() {
    super.initState();
    onInit();
    /* timer = Timer.periodic(
        Duration(seconds: 5),
        (Timer t) => setState(() {
              Api().getUser(id);
            })); */
    // it(
    // );
  }

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
                    'Information',
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
            /* SizedBox(
              height: height * .02,
            ), */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width * .3,
                        height: height * .08,
                        child: Image.asset('assets/logo1.png'),
                      ),
                      FutureBuilder(
                        future: Api().getUser(id),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData)
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            );

                          List<UserModel> data = snapshot.data ?? [];

                          return SizedBox(
                            width: width * .5,
                            height: height * .15,
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                nom = data[index].nomuser!;
                                prenom = data[index].prenomuser!;
                                tel = data[index].telephoneuser!;
                                _nomController.text = data[index].nomuser!;
                                _prenomController.text =
                                    data[index].prenomuser!;
                                _telController.text =
                                    data[index].telephoneuser!;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data[index].nomuser!,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '  ${data[index].prenomuser!}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data[index].telephoneuser!,
                                      style: GoogleFonts.poppins(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  TiInput(
                      color: Color.fromARGB(94, 46, 46, 46),
                      hintText: _nomController.text,
                      hintColor: Colors.white,
                      icon: 'Nom: ',
                      keyboardType: TextInputType.name,
                      readonly: false,

                      // inputController: _nomController,
                      width: width * .9),
                  TiInput(
                      color: Color.fromARGB(94, 46, 46, 46),
                      hintText: _prenomController.text,
                      hintColor: Colors.white,
                      icon: 'Prénom: ',
                      keyboardType: TextInputType.name,
                      readonly: false,
                      // inputController: _prenomController,
                      width: width * .9),
                  TiInput(
                      color: Color.fromARGB(94, 46, 46, 46),
                      hintText: _telController.text,
                      hintColor: Colors.white,
                      icon: 'Tél: ',
                      keyboardType: TextInputType.name,
                      // inputController: _telController,
                      readonly: false,
                      width: width * .9),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showProgress = true;
                        });
                        Api().updateUser(nom, prenom, tel, iduser);
                        setState(() {
                          showProgress = false;
                        });
                      },
                      child: Container(
                        width: width * .3,
                        height: height * .06,
                        margin: EdgeInsets.only(top: 10, right: 11),
                        color: Color.fromARGB(94, 46, 46, 46),
                        child: Center(
                          child: showProgress == true
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                )
                              : Text(
                                  'Modifier',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
