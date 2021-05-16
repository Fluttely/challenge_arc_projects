import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/index_controller.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/parallax.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/transformer_page_view.dart';
import 'package:rx_notifier/rx_notifier.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  SwiperController _swiperController = SwiperController();
  SwiperController _swiperController2 = SwiperController();
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _swiperController.dispose();
    _swiperController2.dispose();
    super.dispose();
  }

  // bool isHovered1.value = false;
  bool isHovered2 = false;
  // bool isActive3 = false;
  // bool isActive4 = false;
  // bool isActive5 = false;

  // bool home = false;
  final valueNotifier = ValueNotifier<bool>(false);
  final home = ValueNotifier<bool>(false);
  final isHovered1 = ValueNotifier<bool>(false);
  static const _duration = Duration(milliseconds: 400);
  @override
  Widget build(BuildContext context) {
    var total = (isHovered1.value ? 6 : 3) + (isHovered1.value ? 3 : 6);
    var width = MediaQuery.of(context).size.width;
    var width1 = (width *
            (home.value
                ? 9
                : isHovered1.value
                    ? 3
                    : 0)) /
        total;
    var width2 = (width *
            (home.value
                ? 0
                : isHovered1.value
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
          InkWell(
            onTap: () {},
            onHover: (value) {
              valueNotifier.value = value;
              // setState(() {
              // isActive5 = value;
              // });
            },
            child: ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (context, value, child) {
                  if (valueNotifier.value) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                  return
                      // AnimatedOpacity(
                      //   opacity: valueNotifier.value ? 0.6: 0,
                      //   duration: _duration,
                      //   child:
                      Container(
                    color: Color(0xFFFC7A09).withOpacity(0.6),
                    child: FadeTransition(
                      opacity: _animation,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: valueNotifier.value ? 10 : 1,
                              sigmaY: valueNotifier.value ? 10 : 1),
                          child: Container(
                            // duration: _duration,
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height,
                            // color: Color(0xFFFC7A09).withOpacity(0.6),
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: valueNotifier.value ? 10 : 0,
                                    sigmaY: 10),
                              ),
                            ),
                          ),
                        ),
                        // ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      Container(
        color: Colors.grey,
      ),
      Stack(
        children: [
          isHovered1.value || home.value
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
                  color: isHovered1.value || home.value
                      ? Colors.transparent
                      : Colors.white,
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
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              if (valueNotifier.value) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // setState(() {
                        home.value = !home.value;
                        // });
                      },
                      onHover: (value) {
                        // setState(() {
                        isHovered1.value = value;
                        // });
                      },
                      child: Text('IMAGE 1'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ];
    List<List<Widget>> lists = [images1]; //, images2];
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     TextButton(
      //       onPressed: () async {
      //         _swiperController.move(1);
      //         await Future.delayed(Duration(milliseconds: 300))
      //             .then((value) => _swiperController2.move(1));
      //       },
      //       child: Icon(Icons.menu),
      //     ),
      //   ],
      // ),
      body: Container(
        color: Colors.grey[900],
        // height: MediaQuery.of(context).size.height ,
        // width: MediaQuery.of(context).size.width,
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
                    home.value = false;
                    // about = false;
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
                        child: Text('IMAGE 1'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          onIndexChanged: (_) {
            home.value = false;
            // about = false;
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
