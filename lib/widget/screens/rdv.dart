import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/main.dart';
import 'package:masculine/models/rdv.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/services/launcher.dart';
import 'package:masculine/services/plug.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/input.dart';
import 'package:masculine/widget/screens/admin.dart';
import 'package:masculine/widget/screens/chat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RendezVous extends StatefulWidget {
  late String? telephoneuser;
  RendezVous({super.key, this.telephoneuser});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late bool showList = false;
  late bool showAdmin = false;
  late bool showProgress = false;
  late String teluser = "";
  late String type_user = "";

  TextEditingController telController = new TextEditingController();

  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tmp = prefs.getString('tel_key');
    setState(() {
      teluser = tmp!;
      showList = true;
    });
    print('___WIDGET__CHANGING__STATES___${teluser}');
    // /* await */ Api().getTypeUser(prefs.getString('tel_key'));
    // /* await */ Api().getDemandeBy(prefs.getString('tel_key'));
  }

  verifyAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // print("__ID__:__${widget.telephoneuser}");
    if (prefs.getString('tel_key') != null) {
      teluser = prefs.getString('tel_key')!;
      print('___FROM___THE___MAIN___${prefs.getString('tel_key')}');
      setState(() {
        widget.telephoneuser = prefs.getString('tel_key');
      });
      print('___FROM__1_THE___MAIN___${widget.telephoneuser}');
    }
  }

  verify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (telController.text != null) {
      type_user = await Api().getTypeUser(telController.text);
      prefs.setString('tel_key', telController.text);
    } else {
      type_user = await Api().getTypeUser(prefs.getString('tel_key'));
    }

    print('_____________________TYPE___$type_user');
    var tmp = prefs.getString('tel_key');
    print("___TAKING___$tmp");

    if (type_user == 'ADMIN') {
      print("\nadmin");

      // Get.to(() => AdminPage(telephoneuser: telController.text));
    } else if (type_user == 'USER') {
      var data = await Api().alreadyExiste(prefs.getString('tel_key'));
      print("___RESULT__$data");
      if (data != null) {
        showSnackBarText('Numéro vérifié!');
        Get.offAll(() => BottomNavBar(
              telephoneuser: widget.telephoneuser,
            ));
      } else {
        showSnackBarText(
            "Numéro incorrect ou aucune demande n'est faite avec ce numéro");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    onInit();
    // verifyAuth();
    // verify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
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
              /* SizedBox(
                height: height * .02,
              ), */
              showList == true
                  ? SizedBox(
                      width: width * .9,
                      height: height * .8,
                      child: FutureBuilder(
                          future: Api().getDemandeBy(teluser),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: Colors.white,
                                ),
                              );
                            }

                            List<RdvModel> data = snapshot.data ?? [];

                            print('__ITEM_NB__${data.length}');

                            return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                /* var date =
                                    DateTime.tryParse(data[index].date_create!);

                                var time_start =
                                    DateTime.tryParse(data[index].date_debut!);
                                var time_go =
                                    DateTime.tryParse(data[index].date_fin!); */

                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            width: width,
                                            height: height * .33,
                                            color: Colors.black,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: height * .05,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: height * .15,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  // color: Colors.black,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(255, 12, 12, 12)
                                                      /* border: Border.all(
                                                          width: .1,
                                                          color: Colors.white) */),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons.message,
                                                                  color: Colors
                                                                      .white, size: 15),
                                                              Text(
                                                                ' TE-${data[index].id_rdv}',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: Colors
                                                                            .white),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                '${data[index].nomuser} ${data[index].prenomuser}',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: Colors
                                                                            .white),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .calendar_month,
                                                                  color: Colors
                                                                      .white, size: 15,),
                                                              Text(
                                                                '${data[index].date_debut} à ${data[index].date_fin}',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .supervised_user_circle,
                                                                  color: Colors
                                                                      .white, size: 15,),
                                                              SizedBox(
                                                                width:
                                                                    width * .23,
                                                                child: Text(
                                                                  '${data[index].titre}',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: width * .25,
                                                            child: Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .monetization_on_rounded,
                                                                    color: Colors
                                                                        .white, size: 15,),
                                                                Text(
                                                                  ' ${data[index].montant}',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                          color: Colors
                                                                              .white),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                          
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "Option:",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                             
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        IconButton(
                                                            onPressed: () {
                                                              Get.to(() =>
                                                                  ChatScreen(
                                                                    telephoneuser:
                                                                        widget
                                                                            .telephoneuser,
                                                                    data: data[
                                                                        index],
                                                                  ));
                                                            },
                                                            icon: Icon(
                                                              Icons.sms,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        IconButton(
                                                            onPressed: () {
                                                              Alert(
                                                                  context:
                                                                      context,
                                                                  desc:
                                                                      'Voulez-vous supprimer votre demande du ${DateTime.tryParse(data[index].date_create!)!.day.toString()}/${DateTime.tryParse(data[index].date_create!)!.month.toString()}/${DateTime.tryParse(data[index].date_create!)!.year.toString()} programmé le ${data[index].day} pour ${data[index].date_debut} à ${data[index].date_fin}',
                                                                  buttons: [
                                                                    DialogButton(
                                                                        width: width *
                                                                            .3,
                                                                        color: Colors
                                                                            .black,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            'Confirmer',
                                                                            style:
                                                                                GoogleFonts.poppins(color: Colors.white),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          Api().deleteRdv(
                                                                              data[index].id_rdv);
                                                                          // Api().updateRdv(date_debut, date_fin, date_create, widget.telephoneuser, data[index].id_rdv);
                                                                          setState(
                                                                              () {
                                                                            data[index];
                                                                          });
                                                                          showSnackBarText(
                                                                              'Votre rendez-vous est supprimé');
                                                                          Navigator.pop(
                                                                              context);
                                                                        }),
                                                                    DialogButton(
                                                                        width: width *
                                                                            .3,
                                                                        color: Colors
                                                                            .red,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            'Annuler',
                                                                            style:
                                                                                GoogleFonts.poppins(color: Colors.white),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        })
                                                                  ]).show();
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: height * .2,
                                    padding: const EdgeInsets.all(15),
                                    margin: EdgeInsets.only(bottom: 10),
                                    // color: Colors.black,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 12, 12, 12)
                                        /* border: Border.all(
                                            width: .1, color: Colors.white) */),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.message,
                                                    size: 15,
                                                    color: Colors.white),
                                                Text(
                                                  ' TE-${data[index].id_rdv}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.person,
                                                    size: 15,
                                                    color: Colors.white),
                                                Text(
                                                  '${data[index].nomuser} ${data[index].prenomuser}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.calendar_month,
                                                    size: 15,
                                                    color: Colors.white),
                                                Text(
                                                  '${data[index].date_debut} à ${data[index].date_fin}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons
                                                        .supervised_user_circle,
                                                    size: 18,
                                                    color: Colors.white),
                                                SizedBox(
                                                  width: width * .24,
                                                  child: Text(
                                                    '${data[index].titre}',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.history,
                                                    size: 18,
                                                    color: Colors.white),
                                                Container(
                                                  // margin: EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    '  ${data[index].status}',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.green),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons
                                                        .monetization_on_rounded,
                                                    size: 18,
                                                    color: Colors.white),
                                                Text(
                                                  ' ${data[index].montant}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    )
                  : Container(
                      width: width * .9,
                      height: height * .8,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * .03,
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
                                "Pour avoir accès à votre liste de rendez-vous veuillez vous connecter",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(),
                                        /* Icon(
                                          Icons.arrow_downward,
                                          color: Colors.white,
                                        ) */
                                      ],
                                    ),
                                    TiInput(
                                        color: Color.fromARGB(94, 46, 46, 46),
                                        hintText: '',
                                        height: height * .08,
                                        icon: '+225',
                                        inputController: telController,
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
                                // authenticate();
                                setState(() {
                                  showProgress = true;
                                });
                                verify();
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Connexion',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
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

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white),
    )));
  }
}
