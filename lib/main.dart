import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masculine/widget/screens/splash.dart';
import 'package:masculine/widget/utils/utils.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SplashScreen();
  }
}
