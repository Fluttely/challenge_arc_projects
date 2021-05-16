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
  bool isHovered3 = false;
  bool isHovered4 = false;
  bool isHovered5 = false;
  bool boxSized = false;
  int backgroundImage = 5;
  bool is2017 = true;
  String pageTitle = '';
  @override
  Widget build(BuildContext context) {
    var total = 11;
    var width = MediaQuery.of(context).size.width;
    var width1 = (width *
            (boxSized
                ? 11
                : isHovered1 ||
                        isHovered2 ||
                        isHovered3 ||
                        isHovered4 ||
                        isHovered5
                    ? 3
                    : 0)) /
        total;
    var width2 = (width *
            (boxSized
                ? 0
                : isHovered1 ||
                        isHovered2 ||
                        isHovered3 ||
                        isHovered4 ||
                        isHovered5
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
                : backgroundImage == 2
                    ? Image.asset(
                        'assets/images/1.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      )
                    : backgroundImage == 3
                        ? Image.asset(
                            'assets/images/7.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          )
                        : backgroundImage == 4
                            ? Image.asset(
                                'assets/images/2.jpg',
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
        // isHovered1
        //     ? Image.asset(
        //         'assets/images/6.jpg',
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height,
        //         fit: BoxFit.cover,
        //       )
        //     : isHovered2
        //         ? Image.asset(
        //             'assets/images/10.1.jpg',
        //             width: MediaQuery.of(context).size.width,
        //             height: MediaQuery.of(context).size.height,
        //             fit: BoxFit.cover,
        //           )
        //         : isHovered3
        //             ? Image.asset(
        //                 'assets/images/1.jpg',
        //                 width: MediaQuery.of(context).size.width,
        //                 height: MediaQuery.of(context).size.height,
        //                 fit: BoxFit.cover,
        //               )
        //             : isHovered4
        //                 ? Image.asset(
        //                     'assets/images/7.jpg',
        //                     width: MediaQuery.of(context).size.width,
        //                     height: MediaQuery.of(context).size.height,
        //                     fit: BoxFit.cover,
        //                   )
        //                 : isHovered5
        //                     ? Image.asset(
        //                         'assets/images/2.jpg',
        //                         width: MediaQuery.of(context).size.width,
        //                         height: MediaQuery.of(context).size.height,
        //                         fit: BoxFit.cover,
        //                       )
        //                     : Container(
        //                         color: Colors.transparent,
        //                         width: MediaQuery.of(context).size.width,
        //                         height: MediaQuery.of(context).size.height,
        //                       ),
        Container(
          color: Colors.transparent,
          child: Row(
            children: [
              AnimatedContainer(
                height: MediaQuery.of(context).size.height,
                width: width1,
                duration: _duration,
                color: isHovered1 ||
                        isHovered2 ||
                        isHovered3 ||
                        isHovered4 ||
                        isHovered5 ||
                        boxSized
                    ? Colors.transparent
                    : Colors.white,
                child: !boxSized
                    ? Container()
                    : DelayedDisplay(
                        delay: Duration(milliseconds: 300),
                        fadingDuration: Duration(milliseconds: 1000),
                        slidingBeginOffset: Offset(-0.1, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                pageTitle,
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: 'Cinzel_Decorative',
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
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
                                  // color: Colors.green,
                                  // height: 250,
                                  height: 170,
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
                                    ],
                                  ),
                                ),
                              ),
                        Spacer(flex: 2),
                        widget.homePage || is2017
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
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'arent fox';
                                                  backgroundImage = 0;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered1 = value;
                                                  pageTitle = 'arent fox';
                                                  backgroundImage = 0;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '23 january',
                                                    style: TextStyle(
                                                      color: isHovered1
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'arent fox',
                                                    style: TextStyle(
                                                      color: isHovered1
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'The space, wich long and narrow...',
                                                    style: TextStyle(
                                                      color: isHovered1
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'réaumur';
                                                  backgroundImage = 1;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered2 = value;
                                                  pageTitle = 'réaumur';
                                                  backgroundImage = 1;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '12 february',
                                                    style: TextStyle(
                                                      color: isHovered2
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'réaumur',
                                                    style: TextStyle(
                                                      color: isHovered2
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'The client boughta new workspace...',
                                                    style: TextStyle(
                                                      color: isHovered2
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          constraints.maxWidth >= 600
                                              ? Container(
                                                  height: 200,
                                                  width: 200,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        boxSized = !boxSized;
                                                        pageTitle = 'neue white';
                                                        backgroundImage = 2;
                                                      });
                                                    },
                                                    onHover: (value) {
                                                      setState(() {
                                                        isHovered3 = value;
                                                        pageTitle = 'neue white';
                                                        backgroundImage = 2;
                                                      });
                                                    },
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '11 april',
                                                          style: TextStyle(
                                                            color: isHovered3
                                                                ? Colors
                                                                    .grey[300]
                                                                : Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12),
                                                        Text(
                                                          'neue white',
                                                          style: TextStyle(
                                                            color: isHovered3
                                                                ? Colors
                                                                    .grey[500]
                                                                : Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          'The office is more like a studio with a...',
                                                          style: TextStyle(
                                                            color: isHovered3
                                                                ? Colors
                                                                    .grey[500]
                                                                : Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    ),
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
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'godrej one';
                                                  backgroundImage = 3;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered4 = value;
                                                  pageTitle = 'godrej one';
                                                  backgroundImage = 3;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '02 june',
                                                    style: TextStyle(
                                                      color: isHovered4
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'godrej one',
                                                    style: TextStyle(
                                                      color: isHovered4
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'The cafe is designed to provide the daily...',
                                                    style: TextStyle(
                                                      color: isHovered4
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'neustar';
                                                  backgroundImage = 4;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered5 = value;
                                                  pageTitle = 'neustar';
                                                  backgroundImage = 4;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '11 august',
                                                    style: TextStyle(
                                                      color: isHovered5
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'neustar',
                                                    style: TextStyle(
                                                      color: isHovered5
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'This bright, alry space also has its own AV system...',
                                                    style: TextStyle(
                                                      color: isHovered5
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        widget.homePage || !is2017
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
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'arent fox';
                                                  backgroundImage = 0;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered1 = value;
                                                  pageTitle = 'arent fox';
                                                  backgroundImage = 0;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '23 january',
                                                    style: TextStyle(
                                                      color: isHovered1
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'arent fox',
                                                    style: TextStyle(
                                                      color: isHovered1
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'The space, wich long and narrow...',
                                                    style: TextStyle(
                                                      color: isHovered1
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'réaumur';
                                                  backgroundImage = 1;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered2 = value;
                                                  pageTitle = 'réaumur';
                                                  backgroundImage = 1;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '12 february',
                                                    style: TextStyle(
                                                      color: isHovered2
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'réaumur',
                                                    style: TextStyle(
                                                      color: isHovered2
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'The client boughta new workspace...',
                                                    style: TextStyle(
                                                      color: isHovered2
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          constraints.maxWidth >= 600
                                              ? Container(
                                                  height: 200,
                                                  width: 200,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        boxSized = !boxSized;
                                                        pageTitle = 'neue white';
                                                        backgroundImage = 2;
                                                      });
                                                    },
                                                    onHover: (value) {
                                                      setState(() {
                                                        isHovered3 = value;
                                                        pageTitle = 'neue white';
                                                        backgroundImage = 2;
                                                      });
                                                    },
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '11 april',
                                                          style: TextStyle(
                                                            color: isHovered3
                                                                ? Colors
                                                                    .grey[300]
                                                                : Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12),
                                                        Text(
                                                          'neue white',
                                                          style: TextStyle(
                                                            color: isHovered3
                                                                ? Colors
                                                                    .grey[500]
                                                                : Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          'The office is more like a studio with a...',
                                                          style: TextStyle(
                                                            color: isHovered3
                                                                ? Colors
                                                                    .grey[500]
                                                                : Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    ),
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
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'godrej one';
                                                  backgroundImage = 3;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered4 = value;
                                                  pageTitle = 'godrej one';
                                                  backgroundImage = 3;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '02 june',
                                                    style: TextStyle(
                                                      color: isHovered4
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'godrej one',
                                                    style: TextStyle(
                                                      color: isHovered4
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'The cafe is designed to provide the daily...',
                                                    style: TextStyle(
                                                      color: isHovered4
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  boxSized = !boxSized;
                                                  pageTitle = 'neustar';
                                                  backgroundImage = 4;
                                                });
                                              },
                                              onHover: (value) {
                                                setState(() {
                                                  isHovered5 = value;
                                                  pageTitle = 'neustar';
                                                  backgroundImage = 4;
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '11 august',
                                                    style: TextStyle(
                                                      color: isHovered5
                                                          ? Colors.grey[300]
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'neustar',
                                                    style: TextStyle(
                                                      color: isHovered5
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'This bright, alry space also has its own AV system...',
                                                    style: TextStyle(
                                                      color: isHovered5
                                                          ? Colors.grey[500]
                                                          : Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
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
