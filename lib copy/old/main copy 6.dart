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

class _MyHomePageState extends State<MyHomePage> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  SwiperController _swiperController = SwiperController();
  SwiperController _swiperController2 = SwiperController();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> images1 = [
      Container(
        color: Colors.black,
        // height: 200,
        // width: 200,
        child: Row(
          children: [
            Expanded(
              flex: isActive1 ? 2:1,
              child: AnimatedContainer(
                color: Colors.blue,
                duration: Duration(milliseconds: 200),
                // width: isActive1
                //     ? MediaQuery.of(context).size.width / 3
                //     : MediaQuery.of(context).size.width / 4,
                child: InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isActive1 = value;
                    });
                  },
                  // child: AnimatedContainer(
                  //   height: MediaQuery.of(context).size.height,
                  //   color: Colors.blue,
                  // ),
                ),
              ),
            ),
              Expanded(
              flex: isActive1? 1:2,
              child: AnimatedContainer(
                color: Colors.red,
                duration: Duration(milliseconds: 200),
                // width: isActive2
                //     ? MediaQuery.of(context).size.width / 3
                //     : MediaQuery.of(context).size.width / 4,
                child: InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isActive2 = value;
                    });
                  },
                  // child: AnimatedContainer(
                  //   height: MediaQuery.of(context).size.height,
                  //   color: Colors.blue,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
      Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg1.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  //  width: MediaQuery.of(context).size.width / 2,
                  // height: MediaQuery.of(context).size.height,
                  color: Colors.blue.withOpacity(0.3),
                ),
              ),
            ),
          )
        ],
      ),
      Container(
        color: Colors.black,
      ),
    ];
    List<Widget> images2 = [
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
    ];
    List<Widget> images3 = [
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
    ];
    List<List<Widget>> lists = [images1, images2, images3];
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
        color: Colors.white,
        // height: MediaQuery.of(context).size.height ,
        // width: MediaQuery.of(context).size.width,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Swiper(
              fade: 0,
              outer: true,
              itemBuilder: (BuildContext context, int index2) {
                return lists[index][index2];
              },
              loop: false,
              scrollDirection: Axis.vertical,
              controller: _swiperController2,
              itemCount: lists[0].length,
            );
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
