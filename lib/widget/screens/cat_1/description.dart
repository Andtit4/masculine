import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/service.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/sign.dart';
import 'package:masculine/widget/login.dart';
import 'package:masculine/widget/partials/am_pm.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/partials/hours.dart';
import 'package:masculine/widget/partials/minutes.dart';
import 'package:masculine/widget/screens/cat_1/payement.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vibration/vibration.dart';

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

  late String _date = "";
  late String _heure_debut = "";
  late String _heure_fin = "";
  late DateTime dateSelect = DateTime.now();
  late String day1 = "";
  late int dayConvert = 0;
  late FixedExtentScrollController _controller = FixedExtentScrollController();
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now() /* .add(const Duration(days: 365)) */,
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // rangeMode: true,
    initialFocusDate: DateTime.now(),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );

  late List day = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

  controleDay() {
    switch (widget.data.day_begin) {
      case 'Lundi':
        setState(() {
          dayConvert = 1;
        });
        return dayConvert;
      case 'Mardi':
        setState(() {
          dayConvert = 2;
        });
        return dayConvert;
      case 'Mercredi':
        setState(() {
          dayConvert = 3;
        });
        return dayConvert;
      case 'Jeudi':
        setState(() {
          dayConvert = 4;
        });
        return dayConvert;
      case 'Vendredi':
        setState(() {
          dayConvert = 5;
        });
        return dayConvert;
      case 'Samedi':
        setState(() {
          dayConvert = 6;
        });
        return dayConvert;
      case 'Dimanche':
        setState(() {
          dayConvert = 7;
        });
        return dayConvert;
    }
    print('dayConvert : $dayConvert');

    for (int i = 1; i <= day.length + 1; i++) {
      if (i == dayConvert) {
        int j = i;
      }
    }
    /* switch (widget.data.day_begin) {
      case 'Lundi':
        setState(() {
          day = day;
        });
        return day;
      case 'Mardi':
        setState(() {
          day = [
            'Mardi',
            'Mercredi',
            'Jeudi',
            'Vendredi',
            'Samedi',
            'Dimanche'
          ];
        });
        return day;
      case 'Mercredi':
        setState(() {
          day = ['Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
        });
        return day;
      case 'Jeudi':
        setState(() {
          day = ['Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
        });
        return day;
      case 'Vendredi':
        setState(() {
          day = ['Vendredi', 'Samedi', 'Dimanche'];
        });
        return day;
      case 'Samedi':
        setState(() {
          day = ['Samedi', 'Dimanche'];
        });
        return day;
    } */
  }

  @override
  void initState() {
    super.initState();
    controleDay();
    // _controller = FixedExtentScrollController();
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
                  child: Row(
                    children: [
                      Container(
                        width: width * .2,
                        height: height * .15,
                        margin: EdgeInsets.only(right: 10),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: width * .2,
                        height: height * .15,
                        margin: EdgeInsets.only(right: 10),

                        // margin: EdgeInsets.only(right: 2),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: width * .2,
                        height: height * .15,
                        margin: EdgeInsets.only(right: 10),

                        // margin: EdgeInsets.only(right: 2),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: width * .2,
                        height: height * .15,
                        margin: EdgeInsets.only(right: 10),

                        // margin: EdgeInsets.only(right: 2),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: width * .2,
                        height: height * .15,
                        margin: EdgeInsets.only(right: 10),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
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
                            height: height * .5,
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
                                  Alert(
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
                                                      /*  if (prefs.getString(
                                                              'tel_key') !=
                                                          null) {
                                                        Get.to(() => PayementScreen(
                                                            data: widget,
                                                            heure_debut:
                                                                '${dateSelect.day}/${dateSelect.month}/${dateSelect.year}',
                                                            heure_fin:
                                                                _heure_debut));
                                                      } */
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
                                      .show();
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

                  /* DatePicker.showDatePicker(
                    context,
                    theme: DatePickerTheme(
                        backgroundColor: Colors.black,
                        itemStyle: GoogleFonts.poppins(color: Colors.white),
                        cancelStyle: GoogleFonts.poppins(color: Colors.white)),
                    showTitleActions: true,
                    minTime: DateTime(2021, 1, 1),
                    maxTime: DateTime(2040, 12, 31),
                    onConfirm: (date) {
                      setState(() {
                        _date = date.toString();
                      });
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                              backgroundColor: Colors.black,
                              itemStyle:
                                  GoogleFonts.poppins(color: Colors.white),
                              cancelStyle:
                                  GoogleFonts.poppins(color: Colors.white)),
                          onConfirm: (time) {
                        setState(() {
                          _heure_debut = time.toString();
                        });
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                                backgroundColor: Colors.black,
                                itemStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                cancelStyle:
                                    GoogleFonts.poppins(color: Colors.white)),
                            onConfirm: (time) {
                          setState(() {
                            _heure_fin = time.toString();
                          });
                          Alert(
                              context: context,
                              desc:
                                  'Confirmez votre rendez pour ${widget.title} pour le $_date de $_heure_debut à $_heure_fin',
                              buttons: [
                                DialogButton(
                                    width: width * .3,
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
                                    }),
                                DialogButton(
                                    width: width * .3,
                                    color: Colors.black,
                                    child: Center(
                                      child: Text(
                                        'Payement',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      if (prefs.getString('tel_key') != null) {
                                        Get.to(() => PayementScreen(
                                            data: widget,
                                            heure_debut: _heure_debut,
                                            heure_fin: _heure_fin));
                                        /* Api().insertDemande(
                                            widget.title,
                                            widget.desc,
                                            widget.montant,
                                            _heure_debut,
                                            _heure_fin,
                                            prefs.getString('tel_key'));
                                        showSnackBarText(
                                            'Votre rendez-vous a bien été envoyé');
                                        Get.offAll(() => BottomNavBar(
                                            telephoneuser:
                                                prefs.getString('tel_key'))); */
                                      } else {
                                        Get.to(
                                            () => LoginPage(
                                                data: widget,
                                                date: _date,
                                                heure_debut: _heure_debut,
                                                heure_fin: _heure_fin),
                                            duration:
                                                Duration(milliseconds: 500),
                                            transition: Transition.rightToLeft);
                                      }
                                    }),
                              ]).show();
                        });
                      });
                    },
                  ); */
                  /* DatePicker.showDateTimePicker(context,
                      theme: DatePickerTheme(
                          backgroundColor: Colors.black,
                          itemStyle: GoogleFonts.poppins(color: Colors.white),
                          cancelStyle:
                              GoogleFonts.poppins(color: Colors.white)),
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2040, 12, 31), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                    Alert(
                        context: context,
                        desc:
                            'Confirmez votre rendez pour ${widget.title} pour le $date',
                        buttons: [
                          DialogButton(
                              width: width * .3,
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  'Payement',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);

                                Get.to(() => LoginPage(data: widget),
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.rightToLeft);

                                /*  Get.to(() => PayementScreen(data: widget),
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.rightToLeft); */
                              }),
                          DialogButton(
                              width: width * .3,
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  'Annuler',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ]).show();
                  }, currentTime: DateTime.now(), locale: LocaleType.fr); */
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

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white),
    )));
  }
}
