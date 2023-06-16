import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/plug.dart';
import 'package:masculine/sign.dart';
import 'package:masculine/widget/login.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/screens/home.dart';
import 'package:masculine/widget/screens/splash.dart';
import 'package:masculine/widget/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zego_zimkit/zego_zimkit.dart';

Future<void> main() async {
  // ZIMKit().init(appID: Utils.id, appSign: Utils.signin);

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  var fontLoader = FontLoader('Poppins');
/*   await fontLoader.loadFont(
    'assets/fonts/Poppins-Regular.ttf' as Uint8List,
  ); */
  /*await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCQ9urMcqSDKRcaprJTNQSxCsCMRQbzq8Q',
          appId: '1:374156658490:web:05929a23d1f33c52837203',
          projectId: 'masculine-28efe',
          messagingSenderId: '374156658490')); */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Masculine',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const MyHomePage(id: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.id});

  final String? id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool shared = false;
  late bool isShow = true;
  late String idtel = "";

  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isShow = PageControl().togglePageShowGet(prefs);
    });
    print("________________$isShow");

    if (widget.id != null) {
      // PageControl().setUserNumber(id, prefs);
      // var tmp = PageControl().getUserNumber(prefs);
      idtel = prefs.getString('tel_key')!;

      print("____1____________$idtel");
    }

    return isShow;
  }

  @override
  void initState() {
    // TODO: implement initState
    onInit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isShow == true
        ? SplashScreen(cred: isShow)
        : idtel != null
            ? BottomNavBar(
                telephoneuser: idtel,
              )
            : Sign();
  }
}
