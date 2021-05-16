import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/index_controller.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/parallax.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/transformer_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remottely',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // AnimationController _controller;
  // Animation _animation;

  SwiperController _swiperController = SwiperController();
  SwiperController _swiperController2 = SwiperController();
  // final = ProjetcsPageController();

  static const _duration = Duration(milliseconds: 400);
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;

  bool home = false;
  @override
  void initState() {
    super.initState();
    // rxObserver(() {
    //   print(home);
    // });
    //   _controller =
    //       AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    //   _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _swiperController.dispose();
    _swiperController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var total = (isHovered1 ? 6 : 3) + (isHovered1 ? 3 : 6);
    var width = MediaQuery.of(context).size.width;
    var width1 = (width *
            (home
                ? 9
                : isHovered1
                    ? 3
                    : 0)) /
        total;
    var width2 = (width *
            (home
                ? 0
                : isHovered1
                    ? 6
                    : 9)) /
        total;
    List<Widget> images1 = [
      Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/1.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Container(
        color: Colors.grey,
      ),
      Stack(
        children: [
          isHovered1 || home
              ? Image.asset(
                  'assets/images/1.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                )
              : isHovered2
                  ? Image.asset(
                      'assets/images/1.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
          Container(
            color: Colors.transparent, //Color(0xFF101820),
            child: Row(
              children: [
                AnimatedContainer(
                  height: MediaQuery.of(context).size.height,
                  width: width1,
                  duration: _duration,
                  color: isHovered1 || home ? Colors.transparent : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "HOME",
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'Cinzel_Decorative',
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  width: width2,
                  duration: _duration,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      home = !home;
                    });
                  },
                  onHover: (value) {
                    isHovered1 = value;
                  },
                  child: Text('p1'),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    List<List<Widget>> lists = [images1]; //, images2];
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Swiper(
                  fade: 0,
                  outer: true,
                  itemBuilder: (BuildContext context, int index2) {
                    return lists[index][index2];
                  },
                  onIndexChanged: (_) {
                    home = false;
                  },
                  loop: false,
                  scrollDirection: Axis.vertical,
                  controller: _swiperController2,
                  itemCount: lists[0].length,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          _swiperController2.move(1);
                          await Future.delayed(Duration(milliseconds: 300))
                              .then((value) => _swiperController2.move(2));
                        },
                        child: Text('projects'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          onIndexChanged: (_) {
            home = false;
          },
          fade: 0,
          outer: true,
          loop: false,
          scrollDirection: Axis.horizontal,
          controller: _swiperController,
          itemCount: lists.length,
        ),
      ),
    );
  }
}
