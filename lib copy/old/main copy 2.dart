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
    List<Color> colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
    ];
    List<Color> colors2 = [
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];
    List<Color> colors3 = [
      Colors.white,
      Colors.grey,
      Colors.black,
    ];
    List<List<Color>> lists = [colors, colors2, colors3];
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Swiper(
              fade: 0.6,
              outer: true,
              itemBuilder: (BuildContext context, int index2) {
                return Container(
                  color: lists[index][index2],
                );
              },
              loop: false,
              scrollDirection: Axis.vertical,
              controller: _swiperController2,
              itemCount: lists[0].length,
            );
          },
          fade: 0.6,
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
