import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/services/plug.dart';
import 'package:masculine/widget/screens/home.dart';
import 'package:masculine/widget/screens/notification.dart';
import 'package:masculine/widget/screens/profile.dart';
import 'package:masculine/widget/screens/rdv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  late String? telephoneuser;
  BottomNavBar({super.key, this.telephoneuser});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _controller = PageController();
  int currentpage = 0;
  // late String? tel = "";

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentpage);
    // onChargerUser();
    // test();
  }

  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;
    onInit() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      setState(() {
        widget.telephoneuser = prefs.getString('tel_key');
      });
    }

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
            HomeScreen(telephoneuser: widget.telephoneuser),
            RendezVous(telephoneuser: widget.telephoneuser),
            NotificationScreen(telephoneuser: widget.telephoneuser),
            ProfileScreen(telephoneuser: widget.telephoneuser)
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.black,
        selectedIndex: currentpage,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        
        // fontStyle: 'Poppins',



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
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.calendar_month,
            title: 'Rendez-vous',
          ),
          BarItem(
            icon: Icons.notifications,
            title: 'Notification',
          ),
          BarItem(
            icon: Icons.person,
            title: 'Compte',
          ),
        ],
      ),
    );
  }
}
