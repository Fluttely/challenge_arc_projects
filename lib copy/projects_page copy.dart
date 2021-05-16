import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:remottely/utils/consts.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage(this.homePage);
  bool homePage;
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  static const _duration = Duration(milliseconds: 400);
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  bool boxSized = false;
  int backgroundImage = 2;
  bool is2017 = true;
  @override
  Widget build(BuildContext context) {
    var total = 11; //(isHovered1 ? 6 : 3) + (isHovered2 ? 3 : 6);
    var width = MediaQuery.of(context).size.width;
    var width1 = (width *
            (boxSized
                ? 11
                : isHovered1 || isHovered2
                    ? 3
                    : 0)) /
        total;
    var width2 = (width *
            (boxSized
                ? 0
                : isHovered1 || isHovered2
                    ? 8
                    : 11)) /
        total;
    return Stack(
      children: [
        backgroundImage == 0
            ? Image.asset(
                'assets/images/6.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )
            : backgroundImage == 1
                ? Image.asset(
                    'assets/images/10.1.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
        isHovered1
            ? Image.asset(
                'assets/images/6.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )
            : isHovered2
                ? Image.asset(
                    'assets/images/10.1.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
        Container(
          color: Colors.transparent,
          child: Row(
            children: [
              AnimatedContainer(
                height: MediaQuery.of(context).size.height,
                width: width1,
                duration: _duration,
                color: isHovered1 || isHovered2 || boxSized
                    ? Colors.transparent
                    : Colors.white,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Flexible(
                    //   child: Text(
                    //     "HOME",
                    //     maxLines: 1,
                    //     style: TextStyle(
                    //         fontFamily: 'Cinzel_Decorative',
                    //         color: Colors.white),
                    //   ),
                    // ),
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
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: boxSized
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(flex: 6),
                        widget.homePage
                            ? Container()
                            : DelayedDisplay(
                                delay: Duration(milliseconds: 1000),
                                child: Container(
                                  color: Colors.green,
                                  // height: 250,
                                  height: 140,
                                  width: 600,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      is2017
                                          ? DelayedDisplay(
                                              delay: Duration(milliseconds: 50),
                                              fadingDuration:
                                                  Duration(milliseconds: 1000),
                                              slidingBeginOffset:
                                                  Offset(0.1, 0),
                                              child: Image.asset(
                                                'assets/images/2017.png',
                                                width: 500,
                                              ),
                                            )
                                          : Container(),
                                      is2017
                                          ? Container()
                                          : DelayedDisplay(
                                              delay: Duration(milliseconds: 50),
                                              fadingDuration:
                                                  Duration(milliseconds: 1000),
                                              slidingBeginOffset:
                                                  Offset(0.1, 0),
                                              child: Image.asset(
                                                'assets/images/2015.png',
                                                width: 500,
                                              ),
                                            ),
                                      // Text(
                                      //   '2015',
                                      //   style: TextStyle(
                                      //       fontSize: 200, color: Colors.brown),
                                      // ),
                                      SizedBox(width: 32),
                                      Column(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                is2017 = true;
                                              });
                                            },
                                            child: Text(
                                              '2017',
                                              style: !is2017
                                                  ? null
                                                  : TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: color1,
                                                    ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          InkWell(
                                            onTap: () {},
                                            child: Text('2016'),
                                          ),
                                          SizedBox(height: 4),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                is2017 = false;
                                              });
                                            },
                                            child: Text(
                                              '2015',
                                              style: is2017
                                                  ? null
                                                  : TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: color1,
                                                    ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          InkWell(
                                            onTap: () {},
                                            child: Text('2014'),
                                          ),
                                          SizedBox(height: 4),
                                          InkWell(
                                            onTap: () {},
                                            child: Text('2013'),
                                          ),
                                        ],
                                      ),
                                      // Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                        Spacer(flex: 2),
                        widget.homePage
                            ? Container()
                            : DelayedDisplay(
                                delay: Duration(milliseconds: 500),
                                child: Container(
                                  width: 600,
                                  height: 400,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Spacer(),
                                          Container(
                                            color: Colors.blue,
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  backgroundImage = 0;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered1 = value;
                                                  // if (backgroundImage != 0) {
                                                  backgroundImage = 0;
                                                  // }
                                                  // isHovered2 = !value;
                                                });
                                              },
                                              child:
                                                  Container(child: Text('p1')),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.red,
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  backgroundImage = 1;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered2 = value;
                                                  // if (backgroundImage != 1) {
                                                  backgroundImage = 1;
                                                  // }
                                                  // isHovered1 = !value;
                                                });
                                              },
                                              child:
                                                  Container(child: Text('p2')),
                                            ),
                                          ),
                                          constraints.maxWidth >= 600
                                              ? Container(
                                                  color: Colors.red,
                                                  height: 200,
                                                  width: 200,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // setState(() {
                                                      //   boxSized = !boxSized;
                                                      //   backgroundImage = 1;
                                                      // });
                                                    },
                                                    onHover: (value) {
                                                      // setState(() {
                                                      //   isHovered2 = value;
                                                      //   // if (backgroundImage != 1) {
                                                      //   backgroundImage = 1;
                                                      //   // }
                                                      //   // isHovered1 = !value;
                                                      // });
                                                    },
                                                    child: Container(
                                                        child: Text('p3')),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          constraints.maxWidth >= 600
                                              ? Container()
                                              : Spacer(),
                                          Container(
                                            color: Colors.blue,
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  backgroundImage = 0;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered1 = value;
                                                  // if (backgroundImage != 0) {
                                                  backgroundImage = 0;
                                                  // }
                                                  // isHovered2 = !value;
                                                });
                                              },
                                              child:
                                                  Container(child: Text('p1')),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.red,
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  backgroundImage = 1;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered2 = value;
                                                  // if (backgroundImage != 1) {
                                                  backgroundImage = 1;
                                                  // }
                                                  // isHovered1 = !value;
                                                });
                                              },
                                              child:
                                                  Container(child: Text('p2')),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        Spacer(flex: 2),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}
