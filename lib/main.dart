import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masculine/services/plug.dart';
import 'package:masculine/widget/partials/bottom_nav.dart';
import 'package:masculine/widget/screens/home.dart';
import 'package:masculine/widget/screens/splash.dart';
import 'package:masculine/widget/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

Future<void> main() async {
  ZIMKit().init(appID: Utils.id, appSign: Utils.signin);

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  /*  await Firebase.initializeApp(
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool shared = false;
  late bool isShow = true;

  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isShow = PageControl().togglePageShowGet(prefs);
    });
    print("________________$isShow");
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
    return isShow == true ? SplashScreen(cred: isShow) : BottomNavBar();
  }
}
