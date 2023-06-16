import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/partials/carousel_image.dart';
import 'package:masculine/widget/screens/cat_1/service.dart';
import 'package:masculine/widget/screens/cat_2/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  late String? telephoneuser;
  HomeScreen({super.key, this.telephoneuser});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  PageController _controller = PageController();
  int currentPage = 0;
  Timer? timer;

  String _caption =
      "Offrez à votre peau le soin qu'elle mérite et révélez votre éclat naturel avec nos soins du visage de qualité professionnelle !";

  List<String> imgList = [
    "https://cdn.pixabay.com/photo/2017/03/10/16/54/hand-massage-2133272_1280.jpg",
        "https://cdn.pixabay.com/photo/2018/02/25/17/58/the-hand-3181279_1280.jpg",
        "https://resize.prod.docfr.doc-media.fr/rcrop/1200,675,center-middle/ext/eac4ff34/content/2022/8/27/1664303710444.jpeg",
        "https://cdn.pixabay.com/photo/2017/03/10/16/54/hand-massage-2133272_1280.jpg",
        "https://cdn.pixabay.com/photo/2018/02/25/17/58/the-hand-3181279_1280.jpg",
  ];
  increment() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage != 4) {
        if (this.mounted) {
          setState(() {
            currentPage++;
          });
        }
      } else {
        _controller.jumpToPage(0);
      }
      _controller.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      print(currentPage);
    });
  }

  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      widget.telephoneuser = prefs.getString('tel_key');
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    onInit();
    increment();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bienvenue \nà Masculine',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                      width: width * .2,
                      height: height * .07,
                      decoration: const BoxDecoration(
                          /* border: Border.all(width: 1, color: Colors.white) */),
                      child: Center(child: Image.asset("assets/logo1.png"))),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                  width: width,
                  height: height * .3,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        controller: _controller,
                        children: imgList
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                      ),
                      Container(
                        width: width,
                        height: height * .8,
                        padding: EdgeInsets.all(width * .04),
                        decoration: const BoxDecoration(
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
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  color: Colors.white,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * .85,
                                  child: Text(
                                    'Sublimez votre beauté avec notre gamme complète de services esthétiques haut de gamme. .',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white),
                                  ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * .3,
                    height: 1,
                    color: Colors.white,
                  ),
                  Container(
                    width: width * .3,
                    height: 1,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ServiceHomme(sexe: 'Masculin'),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                      width: width * .45,
                      height: height * .38,
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://cdn.shopify.com/s/files/1/0601/2262/8344/collections/portrait-homme-souriant-masque-au-charbon-son-visage_f6b84677-1186-4911-9a7e-97be91674c28_750x.jpg?v=1668620947',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: width * .45,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Lui",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ServiceDame(sexe: 'Féminin'),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                      width: width * .45,
                      height: height * .38,
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://4.bp.blogspot.com/-IraIQMMHl8E/XDOM-fAK3vI/AAAAAAAD5kU/-8G3SJbV7GQl6OWGwXODNYcNzRIOkvY_ACLcBGAs/w1200-h630-p-k-no-nu/gommage-visage-grains-avis-comment-pourquoi-ne-pas-utiliser.jpg',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: width * .45,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Elle",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
