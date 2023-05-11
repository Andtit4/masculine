import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/categorie.model.dart';
import 'package:masculine/models/horaire.model.dart';
import 'package:masculine/models/rdv.model.dart';
import 'package:masculine/models/service.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/sign.dart';
import 'package:masculine/widget/login.dart';
import 'package:masculine/widget/partials/am_pm.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/hours.dart';
import 'package:masculine/widget/partials/minutes.dart';
import 'package:masculine/widget/screens/cat_1/payement.dart';
import 'package:masculine/widget/screens/cat_1/service.dart';
import 'package:masculine/widget/screens/cat_2/service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;

class DescribePage extends StatefulWidget {
  final String img;
  final String title;
  final String montant;
  final String desc;
  final ServiceModel data;

  const DescribePage(
      {super.key,
      required this.img,
      required this.title,
      required this.montant,
      required this.desc,
      required this.data});

  @override
  State<DescribePage> createState() => _DescribePageState();
}

class _DescribePageState extends State<DescribePage> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late int poste = 0;
  late String posteSelect = "";
  late String dateCreateToCheck = "";
  List<RdvModel> rdv = [];
  List<dynamic> date_fin = [];

  late String _date = "";
  late String _heure_debut = "";
  late String _heure_fin = "";
  late DateTime dateSelect = DateTime.now();
  late String day1 = "";
  late int dayConvert = 0;

  late List day = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

  StreamController<List<ServiceModel>> _streamControllerService =
      StreamController<List<ServiceModel>>();

  StreamController<List<ServiceModel>> _streamControllerService1 =
      StreamController<List<ServiceModel>>();

  void fetchCategories() async {
    try {
      final List<ServiceModel> service = await Api().getAllServiceByCategory(
          widget.data.titre_categorie, widget.data.genre);
      _streamControllerService.add(service);
    } catch (e) {
      _streamControllerService.addError(e);
    }
  }

  Future getAlready(date_create, poste) async {
    const middleware = "api/rdv";
    var endpoint = "already?date_create=$date_create&poste=$poste";
    String apiUrl = await Api().initializeEndPoint(middleware, endpoint);
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        date_fin == jsonData[0]['date_fin'];
      });
      print('___date____$date_fin');

      return date_fin;
    } else {
      print('___ERROR_GET8_ALREADY____${response.statusCode}');
    }
  }

  void fetchCategories1() async {
    try {
      final List<ServiceModel> service = await Api().getAllServiceByCategory(
          widget.data.titre_categorie, widget.data.genre);
      _streamControllerService1.add(service);
    } catch (e) {
      _streamControllerService1.addError(e);
    }
  }

  onPoste(genre) {
    switch (genre) {
      case 'Féminin':
        setState(() {
          poste = 4;
        });

        return poste = 4;
    }

    if ((genre == 'Masculin') & (widget.data.titre_categorie == 'Coupes')) {
      return poste = 2;
    } else {
      return poste = 4;
    }
  }
  /* getGroupService() async {

  } */

  @override
  void initState() {
    super.initState();
    Api().getCategoryBySex(widget.data.genre);
    fetchCategories();
    fetchCategories1();
    onPoste(widget.data.genre);
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
                height: height * .02,
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
                height: height * .01,
              ),
              Container(
                  width: width,
                  height: height * .3,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        widget.img,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: width,
                        height: height * .8,
                        padding: EdgeInsets.all(width * .04),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Masculine',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Container(
                                  width: width * .1,
                                  height: 1,
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.title,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: height * .04,
              ),
              Container(
                width: width * .3,
                height: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    widget.montant,
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: Color.fromARGB(255, 77, 76, 76)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                widget.desc,
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      )),
                  Text(
                    "Nous voir",
                    style: GoogleFonts.poppins(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                'Service similaire',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                width: width,
                height: height * .1,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: StreamBuilder(
                    stream: _streamControllerService.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError)
                        return Text(
                          'An error occurred ${snapshot.error}',
                          style: GoogleFonts.poppins(color: Colors.white),
                        );
                      List<ServiceModel> data = snapshot.data ?? [];
                      print('Data_length_${data.length}');

                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Text(
                            'Not connected to the stream or null',
                            style: GoogleFonts.poppins(color: Colors.white),
                          );
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          );
                        case ConnectionState.active:
                          return SizedBox(
                            width: width,
                            height: height * .4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => DescribePage(
                                                img: data[index]
                                                    .img_url
                                                    .toString(),
                                                title: data[index]
                                                    .title
                                                    .toString(),
                                                montant: data[index]
                                                    .montant
                                                    .toString(),
                                                desc: data[index]
                                                    .description
                                                    .toString(),
                                                data: widget.data)));
                                  },
                                  child: Container(
                                    width: width * .2,
                                    height: height * .15,
                                    margin: EdgeInsets.only(right: 10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.network(
                                      data[index].img_url.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );

                        default:
                          return Text('');
                      }
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  List<DateTime> weekDays = [];
                  switch (widget.data.day_begin) {
                    case 'Lundi':
                      setState(() {
                        day1 = 'monday';
                      });
                  }

                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Container(
                            width: width,
                            height: height * .532,
                            color: Colors.white,
                            child: TableCalendar(
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              calendarStyle: CalendarStyle(
                                  defaultTextStyle: GoogleFonts.poppins()),
                              headerStyle: HeaderStyle(
                                titleTextStyle: GoogleFonts.poppins(),
                              ),
                              onDaySelected: (selectedDay, focusedDay) {
                                bool sel = false;
                                setState(() {
                                  dateSelect = selectedDay;
                                  sel = true;
                                });
                                print(dateSelect);
                                print(sel);

                                if (sel = true) {
                                  Navigator.pop(context);
                                  _bottomModalPoste(context);
                                  /* Alert(
                                          type: AlertType.warning,
                                          context: context,
                                          style: AlertStyle(
                                            descStyle: GoogleFonts.poppins(),
                                          ),
                                          buttons: [
                                            DialogButton(
                                                color: Colors.green,
                                                child: Center(
                                                  child: Text(
                                                    'Confirmer',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);

                                                  DatePicker.showTimePicker(
                                                      context,
                                                      theme: DatePickerTheme(
                                                        backgroundColor:
                                                            Colors.black,
                                                        itemStyle:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      currentTime:
                                                          DateTime.now(),
                                                      onConfirm: (time) async {
                                                    print(time.hour);
                                                    setState(() {
                                                      _heure_debut =
                                                          '${time.hour}:${time.minute}';
                                                    });

                                                    if (time.hour >=
                                                            int.parse(widget
                                                                .data
                                                                .heure_debut
                                                                .toString()) &&
                                                        (time.hour <=
                                                            int.parse(widget
                                                                    .data
                                                                    .heure_fin
                                                                    .toString()) -
                                                                1)) {
                                                      print(widget
                                                          .data.heure_fin);
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      print(prefs.getString(
                                                          'tel_key'));
                                                      if (prefs.getString(
                                                              'tel_key') !=
                                                          null) {
                                                        Get.to(() => PayementScreen(
                                                            data: widget,
                                                            heure_debut:
                                                                '${dateSelect.day}/${dateSelect.month}/${dateSelect.year}',
                                                            heure_fin:
                                                                _heure_debut));
                                                      } else {
                                                        showSnackBarText(
                                                            'Veillez vous reconnecter session expirée');
                                                        Get.offAll(() => Sign(),
                                                            transition:
                                                                Transition
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                seconds: 1));
                                                      }
                                                    } else {
                                                      print(
                                                          'Erreur time to high');

                                                      Vibration.vibrate(
                                                          amplitude: 40,
                                                          duration: 500);
                                                      showSnackBarText(
                                                          'Vos heure ne correspond pas aux heures de service');
                                                    }
                                                    /* if ((time.hour >=
                                                            int.parse(widget
                                                                .data
                                                                .heure_debut
                                                                .toString())) &&
                                                        (time.hour <=
                                                            int.parse(widget
                                                                .data.heure_fin
                                                                .toString()))) {
                                                      print('object');
                                                      Vibration.vibrate(
                                                          amplitude: 40,
                                                          duration: 500);
                                                      showSnackBarText(
                                                          'Vos heure ne correspond pas aux heures de service');
                                                    } else {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      if (prefs.getString(
                                                              'tel_key') !=
                                                          null) {
                                                        Get.to(() => PayementScreen(
                                                            data: widget,
                                                            heure_debut:
                                                                '${dateSelect.day}/${dateSelect.month}/${dateSelect.year}',
                                                            heure_fin:
                                                                _heure_debut));
                                                      } else {}
                                                    } */
                                                  });
                                                }),
                                            DialogButton(
                                                color: Colors.red,
                                                child: Center(
                                                  child: Text(
                                                    'Annuler',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                          desc:
                                              'Votre service prévue pour le ${dateSelect.day}/${dateSelect.month}/${dateSelect.year} est disponible uniquement de ${widget.data.heure_debut}:00 à ${widget.data.heure_fin}:00')
                                      .show(); */
                                }

                                // Navigator.pop(context);
                                /* DatePicker.showTimePicker(context,
                                    theme: DatePickerTheme(
                                      backgroundColor: Colors.black,
                                      itemStyle: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    currentTime: DateTime.now()); */

                                /* showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (builder) {
                                      return Container(
                                          width: width,
                                          height: height * .3,
                                          color: Colors.black,
                                          child: GestureDetector(

                                            onTap: (){

                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 70,
                                                  child: ListWheelScrollView
                                                      .useDelegate(
                                                    controller: _controller,
                                                    itemExtent: 50,
                                                    perspective: 0.005,
                                                    diameterRatio: 1.2,
                                                    physics:
                                                        FixedExtentScrollPhysics(),
                                                    childDelegate:
                                                        ListWheelChildBuilderDelegate(
                                                      childCount: int.parse(widget
                                                              .data.heure_fin
                                                              .toString()) -
                                                          int.parse(widget
                                                              .data.heure_debut
                                                              .toString()),
                                                      builder: (context, index) {
                                                        return GestureDetector(
                                                          onTap: (){
                                                            setState(() {
                                                              int.par(_heure_debut) == 
                                                            });
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              '${int.parse(widget.data.heure_debut.toString()) + index}',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 22,
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                        /* MyHours(
                                                          hours: index,
                                                        ); */
                                                      },
                                                    ),
                                                  ),
                                                ),
                                          
                                                SizedBox(
                                                  width: 10,
                                                ),
                                          
                                                // minutes wheel
                                                Container(
                                                  width: 70,
                                                  child: ListWheelScrollView
                                                      .useDelegate(
                                                    itemExtent: 50,
                                                    perspective: 0.005,
                                                    diameterRatio: 1.2,
                                                    physics:
                                                        FixedExtentScrollPhysics(),
                                                    childDelegate:
                                                        ListWheelChildBuilderDelegate(
                                                      childCount: 60,
                                                      builder: (context, index) {
                                                        return Center(
                                                          child: Text(
                                                            index < 10
                                                                ? '0' +
                                                                    index
                                                                        .toString()
                                                                : index
                                                                    .toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 22,
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                          ),
                                                        );
                                                        /* MyMinutes(
                                                          mins: index + 30,
                                                        ); */
                                                      },
                                                    ),
                                                  ),
                                                ),
                                          
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '${dateSelect!.day}/${dateSelect!.month}/${dateSelect!.year}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    Colors.white),
                                                      ),
                                                      SizedBox(
                                                        width: width * .05,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          print('object');
                                                          // Navigator.pop(context);
                                                          showSnackBarText(
                                                              'Votre rendez vous prévue pour le ${dateSelect!.day}/${dateSelect!.month}/${dateSelect!.year} à $_heure_debut:$_heure_fin');
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Valider',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_right_alt,
                                                              color: Colors.white,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                          
                                                /* Container(
                                                  width: 70,
                                                  child: ListWheelScrollView
                                                      .useDelegate(
                                                    itemExtent: 50,
                                                    perspective: 0.005,
                                                    diameterRatio: 1.2,
                                                    physics:
                                                        FixedExtentScrollPhysics(),
                                                    childDelegate:
                                                        ListWheelChildBuilderDelegate(
                                                      childCount: 2,
                                                      builder: (context, index) {
                                                        if (index == 0) {
                                                          return AmPm(
                                                            isItAm: true,
                                                          );
                                                        } else {
                                                          return AmPm(
                                                            isItAm: false,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ), */
                                              ],
                                            ),
                                          ));
                                    }); */
                              },
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: dateSelect,
                            ));
                      });
                },
                child: Container(
                  width: double.infinity,
                  height: height * .07,
                  margin: EdgeInsets.only(top: height * .04),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Prendre un rendez-vous',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _bottomModalPoste(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          print('poste_value_$poste');
          return Container(
            width: width,
            height: height * .44,
            color: Colors.black,
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rendez-vous prévu :',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    Text(
                      '${dateSelect.day}/${dateSelect.month}/${dateSelect.year}',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text(
                  'Postes disponibles',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: height * .02,
                ),

                FutureBuilder(
                  future: Api().getCategoryBySex(widget.data.genre),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<CategorieModel> data = snapshot.data ?? [];
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: Colors.white,
                        ),
                      );

                    return SizedBox(
                      width: width,
                      height: height * .22,
                      child: ListView.builder(
                        itemCount: poste,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                posteSelect = 'Poste ${index + 1}';
                                Api().getAlready(
                                    "${dateSelect.day}/${dateSelect.month}/${dateSelect.year}",
                                    posteSelect);
                              });
                              print('Poste_selected: $posteSelect');
                              // Navigator.pop(context);
                              Api().getAlready(
                                  "${dateSelect.year}-0${dateSelect.month}-${dateSelect.day}",
                                  posteSelect);
                              _bottomModalHour(context);
                            },
                            child: Container(
                              width: width,
                              height: height * .08,
                              color: Color.fromARGB(255, 43, 39, 39),
                              margin: EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Poste ${index + 1}',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: Colors.white,
                                  )
                                  // Text('$index', style: GoogleFonts.poppins(color: Colors.white, ),),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )

                /* poste != 0
                                                ? Container(
                                                    width: width,
                                                    height: height * .8,
                                                    child:
                                                        ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemCount: poste,
                                                      itemBuilder:
                                                          (context,
                                                              index) {
                                                        return Container(
                                                          width: width,
                                                          height: height *
                                                              .08,
                                                          color: Colors
                                                              .white,
                                                          margin: EdgeInsets
                                                              .only(
                                                                  bottom:
                                                                      5),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Center(
                                                    child: Text(
                                                      'Aucune donnée',
                                                      style: GoogleFonts
                                                          .poppins(
                                                              color: Colors
                                                                  .white),
                                                    ),
                                                  ) */
                // onPoste(widget.data.genre)
              ],
            ),
          );
        });
  }

  Future<dynamic> _bottomModalHour(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            width: width,
            height: height * .4,
            padding: EdgeInsets.all(10),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // _bottomModalPoste(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${dateSelect.day}/${dateSelect.month}/${dateSelect.year}",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      posteSelect,
                      style: GoogleFonts.poppins(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Disponibilité',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                FutureBuilder(
                  future: Api().getAllHoraire(
                      widget.data.titre_categorie, widget.data.genre),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: Colors.white,
                        ),
                      );
                    }
                    List<HoraireModel> data = snapshot.data ?? [];
                    return GestureDetector(
                      onTap: () {
                        /* Alert(
                                        type: AlertType.warning,
                                        context: context,
                                        style: AlertStyle(
                                          descStyle: GoogleFonts.poppins(),
                                        ),
                                        buttons: [
                                          DialogButton(
                                              color: Colors.green,
                                              child: Center(
                                                child: Text(
                                                  'Confirmer',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }),
                                          DialogButton(
                                              color: Colors.red,
                                              child: Center(
                                                child: Text(
                                                  'Annuler',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                        desc:
                                            'Votre service prévue pour le ${dateSelect.day}/${dateSelect.month}/${dateSelect.year} est disponible uniquement de ${data[index].debut.toString()} à ${data[index].fin.toString()}')
                                    .show(); */
                      },
                      child: SizedBox(
                        height: height * .3,
                        child: FutureBuilder(
                          future: Api().getAlready(
                              "${dateSelect.day}/${dateSelect.month}/${dateSelect.year}",
                              posteSelect),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            List<RdvModel> rdv = snapshot.data ?? [];

                            print('lenght__${rdv.length}');
                            List date_tab = [];
                            for (int i = 0; i < rdv.length; i++) {
                              date_tab.add(rdv[i].date_fin);
                            }
                            print('___tab__${date_tab}');

                            return SizedBox(
                                width: width,
                                height: height * .4,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    List debut = [];
                                    // print('_____data___${data[index].debut}');
                                    for (int i = 0; i < data.length; i++) {
                                      debut.add(data[i].debut);
                                    }
                                    String element = debut[index];
                                    print('__debut___${element}');

                                    Color color = date_tab.contains(element)
                                        ? Colors.red
                                        : Colors.black;
                                    return GestureDetector(
                                      onTap: () {
                                        if (date_tab.contains(element)) {
                                          print('no');
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          showSnackBarText(
                                              'Poste non disponible à cette horaire');
                                        } else {
                                          Alert(
                                                  type: AlertType.warning,
                                                  context: context,
                                                  style: AlertStyle(
                                                    descStyle:
                                                        GoogleFonts.poppins(),
                                                  ),
                                                  buttons: [
                                                    DialogButton(
                                                        color: Colors.green,
                                                        child: Center(
                                                          child: Text(
                                                            'Confirmer',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                          SharedPreferences
                                                              prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          print(prefs.getString(
                                                              'tel_key'));
                                                          if (prefs.getString(
                                                                  'tel_key') !=
                                                              null) {
                                                            Get.to(() => PayementScreen(
                                                                poste:
                                                                    posteSelect,
                                                                data: widget,
                                                                heure_debut:
                                                                    '${dateSelect.day}/${dateSelect.month}/${dateSelect.year}',
                                                                heure_fin: debut[
                                                                        index]
                                                                    .toString()));
                                                          } else {
                                                            showSnackBarText(
                                                                'Veillez vous reconnecter session expirée');
                                                            Get.offAll(
                                                                () => Sign(),
                                                                transition:
                                                                    Transition
                                                                        .rightToLeft,
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            1));
                                                          }
                                                        }),
                                                    DialogButton(
                                                        color: Colors.red,
                                                        child: Center(
                                                          child: Text(
                                                            'Annuler',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        })
                                                  ],
                                                  desc:
                                                      'Votre rendez-vous est prévu pour le ${dateSelect.day}/${dateSelect.month}/${dateSelect.year} est disponible uniquement de ${data[index].debut.toString()}')
                                              .show();
                                        }
                                      },
                                      child: Container(
                                        width: width,
                                        height: height * .08,
                                        margin: EdgeInsets.only(bottom: 5),
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            "${debut[index].toString()}",
                                            style: GoogleFonts.poppins(
                                                color: color),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ));

                            /* Text(
                                      "${data[index].debut.toString()} à ${data[index].fin.toString()}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ); */
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white),
    )));
  }
}
