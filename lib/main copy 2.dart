import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
// import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
// import 'package:flutter_card_swipper/widgets/transformer_page_view/index_controller.dart';
// import 'package:flutter_card_swipper/widgets/transformer_page_view/parallax.dart';
// import 'package:flutter_card_swipper/widgets/transformer_page_view/transformer_page_view.dart';
import 'package:remottely/projects_page.dart';
import 'package:remottely/utils/consts.dart';
import 'package:remottely/utils/my_flutter_app_icons.dart';
import 'package:delayed_display/delayed_display.dart';

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
        fontFamily: 'Playfair_Display_SC',
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

  @override
  void initState() {
    setState(() {
      homePage = false;
    });
    _swiperController2.move(1);
    Future.delayed(Duration(milliseconds: 300))
        .then((value) => _swiperController2.move(2));

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

  // int currentIndex = 0;
  bool homePage = true;
  bool boxSized = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> images1 = [
      Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/old_man_original.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Container(
        color: Colors.grey,
      ),
      ProjectsPage(homePage, boxSized),
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
                    // setState(() {
                    // currentIndex = index2;
                    // });
                    // print(currentIndex.toString());
                    return lists[index][index2];
                  },
                  onIndexChanged: (_) {
                    // home = false;
                  },
                  loop: false,
                  scrollDirection: Axis.vertical,
                  controller: _swiperController2,
                  itemCount: lists[0].length,
                ),
                Container(
                  padding: EdgeInsets.all(64),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'a \\ rc',
                              style: TextStyle(
                                color: color2,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Spacer(flex: 3),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                MyFlutterApp.braille_1,
                                color: color2,
                                size: 20,
                              ),
                            ),
                            Spacer(flex: 2),
                            InkWell(
                              onTap: () async {
                                if (_swiperController2.index != 0) {
                                  setState(() {
                                    homePage = true;
                                  });
                                  _swiperController2.move(1);
                                  await Future.delayed(
                                          Duration(milliseconds: 300))
                                      .then((value) =>
                                          _swiperController2.move(0));
                                  // _swiperController2.index = 0;
                                }
                              },
                              child: Text(
                                'home',
                                style: homePage
                                    ? TextStyle(
                                        color: color1,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                              ),
                            ),
                            Spacer(flex: 1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (_swiperController2.index != 2) {
                                      setState(() {
                                        homePage = false;
                                      });
                                      _swiperController2.move(1);
                                      await Future.delayed(
                                              Duration(milliseconds: 300))
                                          .then((value) =>
                                              _swiperController2.move(2));

                                      // _swiperController2.index = 0;
                                    }
                                  },
                                  child: Text(
                                    'projects',
                                    style: !homePage
                                        ? TextStyle(
                                            color: color1,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold,
                                          )
                                        : TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                  ),
                                ),
                                SizedBox(height: 32),
                                homePage
                                    ? Container(width: 208) //169)
                                    : DelayedDisplay(
                                        delay: Duration(milliseconds: 500),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                'in progress',
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: color1,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 32),
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                'completed',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                            homePage ? SizedBox(height: 70) : Container(),
                            Spacer(flex: 2),
                            Text(
                              'contact',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Spacer(flex: 4),
                          ],
                        ),
                      ),
                      Spacer(flex: 2),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'about us',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Spacer(flex: 31),
                            homePage
                                ? Container()
                                : DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    child: Column(
                                      children: [
                                        // SizedBox(height: 64),
                                        Text('all'),
                                        SizedBox(height: 32),
                                        Text('interior'),
                                        SizedBox(height: 32),
                                        Text('exterior'),
                                      ],
                                    ),
                                  ),
                            Spacer(flex: 113),
                            SizedBox(
                              width: 300,
                              height: 300,
                              child: homePage
                                  ? DelayedDisplay(
                                      delay: Duration(milliseconds: 500),
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                      ),
                                    )
                                  : Container(),
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                      ),
                      Spacer(flex: 2),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Spacer(flex: 3),
                            homePage
                                ? DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    child: IconButton(
                                      onPressed: () async {
                                        if (_swiperController2.index != 2) {
                                          _swiperController2.move(1);
                                          await Future.delayed(
                                                  Duration(milliseconds: 300))
                                              .then((value) =>
                                                  _swiperController2.move(2));
                                          // _swiperController2.index = 0;
                                        }
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 48,
                                      ),
                                    ),
                                  )
                                : Container(),
                            !homePage
                                ? DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    child: IconButton(
                                      onPressed: () async {
                                        if (_swiperController2.index != 2) {
                                          _swiperController2.move(1);
                                          await Future.delayed(
                                                  Duration(milliseconds: 300))
                                              .then((value) =>
                                                  _swiperController2.move(2));
                                          // _swiperController2.index = 0;
                                        }
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 48,
                                      ),
                                    ),
                                  )
                                : Container(),
                            Spacer(flex: 10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Connect with us'),
                                  SizedBox(height: 24),
                                  Row(children: [
                                    Text(
                                      'Facebook',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Instagram',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ]),
                                ]),
                            // Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          onIndexChanged: (_) {
            // home = false;
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
