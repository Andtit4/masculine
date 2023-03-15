import 'dart:async';

import 'package:flutter/material.dart';

class TiCarousel extends StatefulWidget {
  final double width;
  final double height;
  final List<String> imgList;
  const TiCarousel(
      {super.key,
      required this.height,
      required this.width,
      required this.imgList});

  @override
  State<TiCarousel> createState() => _TiCarouselState();
}

class _TiCarouselState extends State<TiCarousel> {
  PageController _controller = PageController();
  int currentPage = 0;
  Timer? timer;

  increment() {
    timer = Timer.periodic(Duration(seconds: 15), (timer) {
      if (currentPage != 1) {
        setState(() {
          currentPage++;
        });
      } else {
        _controller.jumpToPage(0);
      }
      _controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      print(currentPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    increment();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: PageView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          controller: _controller,
          onPageChanged: (index) {},
          children: widget.imgList
              .map((e) => Container(
                    width: widget.width,
                    height: widget.height,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Image.network(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList()
          /* Container(
            width: widget.width,
            height: widget.height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Image.network(widget.imgList),
          ), */

          ),
    );
  }
}
