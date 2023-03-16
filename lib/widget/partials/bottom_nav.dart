import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/home.dart';
import 'package:masculine/widget/screens/notification.dart';
import 'package:masculine/widget/screens/profile.dart';
import 'package:masculine/widget/screens/rdv.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _controller = PageController();
  int currentpage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: currentpage);
  }

  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              currentpage = index;
            });
          },
          children: [
            HomeScreen(),
            RendezVous(),
            NotificationScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        selectedIndex: currentpage,
        activeColor: Colors.black,
        inactiveColor: Colors.black,
        // fontStyle: FontS,
        onButtonPressed: (index) {
          setState(() {
            currentpage = index;
          });
          _controller.animateToPage(currentpage,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        barItems: <BarItem>[
          BarItem(
            icon: Icons.event,
            title: 'Home',

            // activeColor: Colors.blue,
            // inactiveColor: Colors.orange,
          ),
          BarItem(
            icon: Icons.calendar_month,
            title: 'Rendez-vous',
            // activeColor: Colors.yellow,
            // inactiveColor: Colors.green,
          ),
          BarItem(
            icon: Icons.notifications,
            title: 'Notification',
            // activeColor: Colors.blue,
            // inactiveColor: Colors.red,
          ),
          BarItem(
            icon: Icons.person,
            title: 'Compte',
            // activeColor: Colors.cyan,
            // inactiveColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
