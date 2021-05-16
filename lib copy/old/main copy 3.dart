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
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
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
  SwiperController _swiperControllerHorizontal = SwiperController();
  SwiperController _swiperController2 = SwiperController();

  @override
  Widget build(BuildContext context) {
    List<Container> containers1 = [
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
              child: Image.asset('assets/images/bg1.jpg'),
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
              child: Image.asset('assets/images/bg1.jpg'),
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
    ];
    List<Container> containers2 = [
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
    ];
    List<Container> containers3 = [
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
      Container(
        color: Colors.black,
        child: Swiper(
          fade: 0.8,
          outer: true,
          itemBuilder: (BuildContext context, int index2) {
            return Container(
              color: Colors.white,
            );
          },
          loop: false,
          scrollDirection: Axis.vertical,
          controller: _swiperController2,
          itemCount: 3,
        ),
      ),
    ];
    List<List<Container>> lists = [containers1, containers2, containers3];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              _swiperController2.move(1);
              await Future.delayed(Duration(milliseconds: 800))
                  .then((value) => _swiperController2.move(2));
            },
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return containers1[index];
            // return Container(
            //   color: colors[index],
            //   child: Swiper(
            //     fade: 0.8,
            //     outer: true,
            //     itemBuilder: (BuildContext context, int index2) {
            //       return Container(
            //         color: lists[index][index2],
            //       );
            //     },
            //     loop: false,
            //     scrollDirection: Axis.vertical,
            //     controller: _swiperController2,
            //     itemCount: lists[0].length,
            //     // viewportFraction: 0.8,
            //     // scale: 0.9,
            //   ),
            // );
          },
          // layout: SwiperLayout.TINDER,
          // itemWidth: MediaQuery.of(context).size.width,
          //    itemHeight: MediaQuery.of(context).size.height,
          fade: 0.8,
          outer: true,
          loop: false,
          scrollDirection: Axis.horizontal,
          controller: _swiperControllerHorizontal,
          itemCount: lists.length,
          // viewportFraction: 0.8,
          // scale: 0.9,
        ),
      ),
    );
  }
}
