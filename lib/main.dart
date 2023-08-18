import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';




import 'package:remottely/projects_page.dart';
import 'package:remottely/utils/consts.dart';
import 'package:remottely/utils/my_flutter_app_icons.dart';
import 'package:delayed_display/delayed_display.dart';
import "package:visibility_detector/visibility_detector.dart";

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
  

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  
  

  
  SwiperController _swiperController2 = SwiperController();
  

  @override
  void initState() {
    setState(() {
      isCurrentItem = 0;
    });
    _swiperController2.move(1);
    Future.delayed(Duration(milliseconds: 300))
        .then((value) => _swiperController2.move(2));

    super.initState();
    
    
    
    
    
    
  }

  @override
  void dispose() {
    
    
    _swiperController2.dispose();
    super.dispose();
  }

  
  
  bool boxSized = false;
  int isCurrentItem = 0;
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
        color: Colors.transparent,
      ),
      ProjectsPage(isCurrentItem == 0 ? true : false, boxSized),
    ];
    List<List<Widget>> lists = [images1]; 

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(
            color: Colors.grey[300],
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Swiper(
                      fade: 0,
                      outer: true,
                      itemBuilder: (BuildContext context, int index2) {
                        
                        
                        
                        
                        return VisibilityDetector(
                          key: Key(index.toString()),
                          onVisibilityChanged: (VisibilityInfo info) {
                            if (info.visibleFraction == 1 &&
                                index2 != 1 &&
                                index2 == 0) {
                              setState(() {
                                isCurrentItem = index2;
                              });
                            }
                            
                            
                            
                          },
                          child: lists[index][index2],
                        );
                      },
                      onIndexChanged: (_) {
                        
                      },
                      loop: false,
                      scrollDirection: Axis.vertical,
                      controller: _swiperController2,
                      itemCount: lists[0].length,
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(constraints.maxWidth >= 600 ? 64 : 16),
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
                                constraints.maxWidth >= 600
                                    ? Text(
                                        'a \\ rc',
                                        style: TextStyle(
                                          color: color2,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      )
                                    : Container(),
                                Spacer(flex: 3),
                                constraints.maxWidth >= 600
                                    ? Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          MyFlutterApp.braille_1,
                                          color: color2,
                                          size: 20,
                                        ),
                                      )
                                    : Container(),
                                Spacer(flex: 2),
                                
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: InkWell(
                                    onTap: () async {
                                      if (_swiperController2.index != 0) {
                                        _swiperController2.move(1);
                                        await Future.delayed(
                                                Duration(milliseconds: 300))
                                            .then((value) =>
                                                _swiperController2.move(0));
                                        setState(() {
                                          isCurrentItem = 0;
                                        });
                                        
                                      }
                                    },
                                    child: Text(
                                      'home',
                                      style: isCurrentItem == 0
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
                                ),
                                Spacer(
                                    flex: constraints.maxWidth >= 600 ? 1 : 3),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 200,),
                                    InkWell(
                                      onTap: () async {
                                        if (_swiperController2.index != 2) {
                                          setState(() {
                                            isCurrentItem = 2;
                                          });
                                          _swiperController2.move(1);
                                          await Future.delayed(
                                                  Duration(milliseconds: 300))
                                              .then((value) =>
                                                  _swiperController2.move(2));

                                          
                                        }
                                      },
                                      child: Text(
                                        'projects',
                                        style: isCurrentItem != 0
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
                                    SizedBox(
                                        height: constraints.maxWidth >= 600
                                            ? 32
                                            : 16),
                                    isCurrentItem == 0
                                        ? Container(width: 208) 
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
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                                isCurrentItem == 0
                                    ? SizedBox(height: 70)
                                    : Container(),
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
                          Spacer(flex: constraints.maxWidth >= 600 ? 2 : 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                Spacer(flex: 31),
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                Spacer(flex: 113),
                              
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
                                isCurrentItem == 0
                                    ? DelayedDisplay(
                                        delay: Duration(milliseconds: 500),
                                        child: IconButton(
                                          onPressed: () async {
                                            if (_swiperController2.index != 2) {
                                              _swiperController2.move(1);
                                              await Future.delayed(Duration(
                                                      milliseconds: 300))
                                                  .then((value) =>
                                                      _swiperController2
                                                          .move(2));
                                              
                                            }
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 48,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                isCurrentItem != 0
                                    ? DelayedDisplay(
                                        delay: Duration(milliseconds: 500),
                                        child: IconButton(
                                          onPressed: () async {
                                            if (_swiperController2.index != 2) {
                                              _swiperController2.move(1);
                                              await Future.delayed(Duration(
                                                      milliseconds: 300))
                                                  .then((value) =>
                                                      _swiperController2
                                                          .move(2));
                                              
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
                
              },
              fade: 0,
              outer: true,
              loop: false,
              scrollDirection: Axis.horizontal,
              
              itemCount: lists.length,
            ),
          ),
        );
      },
    );
  }
}
