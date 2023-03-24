import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/rdv.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/services/launcher.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/input.dart';
import 'package:masculine/widget/screens/admin.dart';
import 'package:masculine/widget/screens/chat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class RendezVous extends StatefulWidget {
  final String? telephoneuser;
  const RendezVous({super.key, this.telephoneuser});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late bool showList = false;
  late bool showAdmin = false;

  TextEditingController telController = new TextEditingController();

  verifyAuth() {
    print("__ID__:__${widget.telephoneuser}");

    if (widget.telephoneuser != null) {
      setState(() {
        showList = true;
      });
    }
  }

  verify() async {
    final type_user = await Api().getTypeUser(telController.text);
    print('_____________________TYPE___$type_user');

    if (type_user == 'ADMIN') {
      print("\nadmin");
      await ZIMKit().connectUser(id: 'admin', name: 'admin');
      Get.to(() => AdminPage(telephoneuser: telController.text));
    } else if (type_user == 'USER') {
      var data = await Api().alreadyExiste(telController.text);
      print("___RESULT__$data");
      if (data != null) {
        await ZIMKit()
            .connectUser(id: telController.text, name: telController.text);
        showSnackBarText('Numéro vérifié!');
        Get.offAll(() => BottomNavBar(
              telephoneuser: telController.text,
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
    verifyAuth();
    verify();
    Api().getDemandeBy(widget.telephoneuser);
    Api().getTypeUser(telController.text);
    // Api().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Rendez-vous',
          style: GoogleFonts.poppins(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'New Chat',
                  child: const ListTile(
                      leading: Icon(CupertinoIcons.chat_bubble_2_fill),
                      title: Text('Vos réponses', maxLines: 1)),
                  onTap: () => Get.to(() => ChatScreen())
                )
              ];
            },
          ),
        ],
      ), */
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
                          future: Api().getDemandeBy(widget.telephoneuser),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              const CircularProgressIndicator(
                                strokeWidth: 1,
                                color: Colors.white,
                              );
                            }

                            List<RdvModel> data = snapshot.data ?? [];

                            print('__ITEM_NB__${data.length}');

                            return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var date =
                                    DateTime.tryParse(data[index].date_create!);

                                var time_start =
                                    DateTime.tryParse(data[index].date_debut!);
                                var time_go =
                                    DateTime.tryParse(data[index].date_fin!);

                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            width: width,
                                            height: height * .3,
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
                                                      border: Border.all(
                                                          width: .1,
                                                          color: Colors.white)),
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
                                                                      .white),
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
                                                                      .white),
                                                              Text(
                                                                '${date.day}/${date.month}/${date.year} de ${time_start.hour}:${time_start.minute}:${time_start.second} à ${time_go.hour}:${time_go.minute}:${time_go.second}',
                                                                style: GoogleFonts
                                                                    .poppins(
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
                                                                      .white),
                                                              SizedBox(
                                                                width:
                                                                    width * .2,
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
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons.history,
                                                                  color: Colors
                                                                      .white),
                                                              Container(
                                                                // margin: EdgeInsets.only(left: 20),
                                                                child: Text(
                                                                  '  En attente',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                          color:
                                                                              Colors.green),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .monetization_on_rounded,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                ' ${data[index].montant}',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: Colors
                                                                            .white),
                                                              )
                                                            ],
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
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  minTime:
                                                                      DateTime(
                                                                          2020,
                                                                          1,
                                                                          1),
                                                                  maxTime:
                                                                      DateTime(
                                                                          2040,
                                                                          12,
                                                                          31),
                                                                  onConfirm:
                                                                      (date) {
                                                                var date_create =
                                                                    date;

                                                                DatePicker.showTimePicker(
                                                                    context,
                                                                    onConfirm:
                                                                        (time) {
                                                                  var date_debut =
                                                                      time;

                                                                  DatePicker.showTimePicker(
                                                                      context,
                                                                      onConfirm:
                                                                          (time) {
                                                                    var date_fin =
                                                                        time;

                                                                    Alert(
                                                                        context:
                                                                            context,
                                                                        desc:
                                                                            'Modifiez la date de votre rendez-vous sur le ${date_create.day}/${date_create.month}/${date_create.year}, de ${date_debut.hour}:${date_debut.minute}:${date_debut.second} à  ${date_fin.hour}:${date_fin.minute}:${date_fin.second}',
                                                                        buttons: [
                                                                          DialogButton(
                                                                              width: width * .3,
                                                                              color: Colors.black,
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Confirmer',
                                                                                  style: GoogleFonts.poppins(color: Colors.white),
                                                                                ),
                                                                              ),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                                Api().updateRdv(date_debut, date_fin, date_create, widget.telephoneuser, data[index].id_rdv);
                                                                                setState(() {
                                                                                  data[index];
                                                                                });
                                                                                showSnackBarText('Date de rendez-vous modifiée avec succès!');
                                                                                Navigator.pop(context);
                                                                              }),
                                                                          DialogButton(
                                                                              width: width * .3,
                                                                              color: Colors.red,
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Annuler',
                                                                                  style: GoogleFonts.poppins(color: Colors.white),
                                                                                ),
                                                                              ),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              })
                                                                        ]).show();
                                                                  });
                                                                });
                                                              });
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
                                                                      'Voulez-vous supprimer votre demande du ${date.day}/${date.month}/${date.year} de ${time_start.hour}:${time_start.minute}:${time_start.second} à ${time_go.hour}:${time_go.minute}:${time_go.second}',
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
                                    height: height * .15,
                                    padding: const EdgeInsets.all(15),
                                    // color: Colors.black,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: .1, color: Colors.white)),
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
                                                    color: Colors.white),
                                                Text(
                                                  ' TE-${data[index].id_rdv}',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.person,
                                                    color: Colors.white),
                                                Text(
                                                  '${data[index].nomuser} ${data[index].prenomuser}',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.calendar_month,
                                                    color: Colors.white),
                                                Text(
                                                  '${date!.day}/${date.month}/${date.year} de ${time_start!.hour}:${time_start.minute}:${time_start.second} à ${time_go!.hour}:${time_go.minute}:${time_go.second}',
                                                  style: GoogleFonts.poppins(
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
                                                    color: Colors.white),
                                                SizedBox(
                                                  width: width * .2,
                                                  child: Text(
                                                    '${data[index].titre}',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.history,
                                                    color: Colors.white),
                                                Container(
                                                  // margin: EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    '  ${data[index].status}',
                                                    style: GoogleFonts.poppins(
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
                                                    color: Colors.white),
                                                Text(
                                                  ' ${data[index].montant}',
                                                  style: GoogleFonts.poppins(
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
                                verify();
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
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
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
