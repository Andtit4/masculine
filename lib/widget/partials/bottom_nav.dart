import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/widget/screens/home.dart';
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
          children: [
            HomeScreen(),
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        selectedIndex: currentpage,
        activeColor: Colors.blue,
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
            icon: Icons.search_rounded,
            title: 'Search',
            // activeColor: Colors.yellow,
            // inactiveColor: Colors.green,
          ),
          BarItem(
            icon: Icons.bolt_rounded,
            title: 'Energy',
            // activeColor: Colors.blue,
            // inactiveColor: Colors.red,
          ),
          BarItem(
            icon: Icons.tune_rounded,
            title: 'Settings',
            // activeColor: Colors.cyan,
            // inactiveColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
