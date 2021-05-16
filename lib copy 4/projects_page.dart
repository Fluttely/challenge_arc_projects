import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:remottely/utils/consts.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage(this.homePage, this.boxSized);
  bool homePage;
  bool boxSized;
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
  // bool widget.boxSized = false;
  int backgroundImage = 5;
  bool is2017 = true;
  String pageTitle = '';
  String pageDay = '';
  String pageMonth = '';
  @override
  Widget build(BuildContext context) {
    var total = 110;
    var width = MediaQuery.of(context).size.width;
    var width1 = (width *
            (widget.boxSized
                ? 110
                : isHovered1 ||
                        isHovered2 ||
                        isHovered3 ||
                        isHovered4 ||
                        isHovered5
                    ? 35
                    : 0)) /
        total;
    var width2 = (width *
            (widget.boxSized
                ? 0
                : isHovered1 ||
                        isHovered2 ||
                        isHovered3 ||
                        isHovered4 ||
                        isHovered5
                    ? 75
                    : 110)) /
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
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
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
                            widget.boxSized
                        ? Colors.transparent
                        : Colors.white,
                    child: !widget.boxSized
                        ? Container()
                        : DelayedDisplay(
                            delay: Duration(milliseconds: 50),
                            fadingDuration: Duration(milliseconds: 1000),
                            slidingBeginOffset: Offset(-0.1, 0),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  constraints.maxWidth < 600 ? 16 : 64.0),
                              child: Column(
                                children: [
                                  Spacer(flex: 5),
                                  Row(
                                    children: [
                                      Spacer(flex: 4),
                                      constraints.maxWidth >= 600 ? DelayedDisplay(
                                        delay: Duration(milliseconds: 300),
                                        fadingDuration:
                                            Duration(milliseconds: 1000),
                                        slidingBeginOffset: Offset(0.0, 1),
                                        child: Text(
                                          'more\nprojects',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            // fontFamily: 'Cinzel_Decorative',
                                            color: Colors.black,
                                            // fontSize: 18,
                                          ),
                                        ),
                                      ) : Container(),
                                      Spacer(flex: 1),
                                      DelayedDisplay(
                                        delay: Duration(milliseconds: 300),
                                        fadingDuration:
                                            Duration(milliseconds: 1000),
                                        slidingBeginOffset: Offset(-0.1, 0),
                                        child: Text(
                                          pageTitle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Cinzel_Decorative',
                                            color: Colors.black,
                                            fontSize: 60,
                                          ),
                                        ),
                                      ),
                                      Spacer(flex: 6),
                                    ],
                                  ),
                                  Spacer(flex: 2),
                                  Row(
                                    children: [
                                      Spacer(flex: 6),
                                      DelayedDisplay(
                                        delay: Duration(milliseconds: 300),
                                        fadingDuration:
                                            Duration(milliseconds: 1000),
                                        slidingBeginOffset: Offset(0.0, 1),
                                        child: Text(
                                          'about',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            // fontFamily: 'Cinzel_Decorative',
                                            color: Colors.black,
                                            // fontSize: 60,
                                          ),
                                        ),
                                      ),
                                      Spacer(flex: 2),
                                    ],
                                  ),
                                  Spacer(flex: 3),
                                  DelayedDisplay(
                                    delay: Duration(milliseconds: 300),
                                    fadingDuration:
                                        Duration(milliseconds: 1000),
                                    slidingBeginOffset: Offset(0.0, 1),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              pageDay,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(height: 128),
                                            Text(
                                              '/ ' + pageMonth,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(flex: 1),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.boxSized =
                                                  !widget.boxSized;
                                            });
                                          },
                                          child: Text('hide information'),
                                        ),
                                        Spacer(flex: 2),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  AnimatedContainer(
                    height: MediaQuery.of(context).size.height,
                    width: width2,
                    duration: _duration,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: widget.boxSized
                  ? Container()
                  : widget.homePage
                      ? Container()
                      : Row(
                          children: [
                            Spacer(flex: 23),
                            constraints.maxWidth < 600
                                ? Container()
                                : DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // SizedBox(height: 64),
                                        Text(
                                          'all',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        SizedBox(height: 32),
                                        Text('interior',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: color1,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(height: 32),
                                        Text(
                                          'exterior',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Spacer(flex: 7),
                            Column(
                              children: [
                                Spacer(flex: 6),
                                DelayedDisplay(
                                  delay: Duration(milliseconds: 1000),
                                  child: Container(
                                    height: 170,
                                    width:
                                        constraints.maxWidth < 600 ? 400 : 600,
                                    child: Row(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      children: [
                                        Spacer(),
                                        is2017
                                            ? DelayedDisplay(
                                                delay:
                                                    Duration(milliseconds: 50),
                                                fadingDuration: Duration(
                                                    milliseconds: 1000),
                                                slidingBeginOffset:
                                                    Offset(0.1, 0),
                                                child: Image.asset(
                                                  'assets/images/2017.png',
                                                  width:
                                                      constraints.maxWidth < 600
                                                          ? 360
                                                          : 500,
                                                ),
                                              )
                                            : Container(),
                                        is2017
                                            ? Container()
                                            : DelayedDisplay(
                                                delay:
                                                    Duration(milliseconds: 50),
                                                fadingDuration: Duration(
                                                    milliseconds: 1000),
                                                slidingBeginOffset:
                                                    Offset(0.1, 0),
                                                child: Image.asset(
                                                  'assets/images/2015.png',
                                                  width:
                                                      constraints.maxWidth < 600
                                                          ? 360
                                                          : 500,
                                                ),
                                              ),
                                        SizedBox(width: 32),
                                        constraints.maxWidth < 600
                                            ? Container()
                                            : Column(
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
                                                              decoration:
                                                                  TextDecoration
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
                                                              decoration:
                                                                  TextDecoration
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
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(flex: 2),
                                !is2017
                                    ? Container()
                                    : DelayedDisplay(
                                        delay: Duration(milliseconds: 500),
                                        child: Container(
                                          width: constraints.maxWidth < 600
                                              ? 400
                                              : 600,
                                          height: 400,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle =
                                                              'arent fox';
                                                          pageDay = '23';
                                                          pageMonth = '01';
                                                          backgroundImage = 0;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered1 = value;
                                                          pageDay = '23';
                                                          pageMonth = '01';
                                                          backgroundImage = 0;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '23 january',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered1
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'arent fox',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered1
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'The space, wich long and narrow...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered1
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle = 'réaumur';
                                                          pageDay = '12';
                                                          pageMonth = '02';
                                                          backgroundImage = 1;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered2 = value;
                                                          pageDay = '12';
                                                          pageMonth = '02';
                                                          backgroundImage = 1;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '12 february',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered2
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'réaumur',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered2
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'The client boughta new workspace...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered2
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                                                widget.boxSized =
                                                                    !widget
                                                                        .boxSized;
                                                                pageTitle =
                                                                    'neue white';
                                                                pageDay = '11';
                                                                pageMonth =
                                                                    '04';
                                                                backgroundImage =
                                                                    2;
                                                              });
                                                            },
                                                            onHover: (value) {
                                                              setState(() {
                                                                isHovered3 =
                                                                    value;
                                                                pageDay = '11';
                                                                pageMonth =
                                                                    '04';
                                                                backgroundImage =
                                                                    2;
                                                              });
                                                            },
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '11 april',
                                                                  style:
                                                                      TextStyle(
                                                                    color: isHovered3
                                                                        ? Colors.grey[
                                                                            300]
                                                                        : Colors
                                                                            .grey,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 12),
                                                                Text(
                                                                  'neue white',
                                                                  style:
                                                                      TextStyle(
                                                                    color: isHovered3
                                                                        ? Colors.grey[
                                                                            500]
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  'The office is more like a studio with a...',
                                                                  style:
                                                                      TextStyle(
                                                                    color: isHovered3
                                                                        ? Colors.grey[
                                                                            500]
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle =
                                                              'godrej one';
                                                          pageDay = '02';
                                                          pageMonth = '06';
                                                          backgroundImage = 3;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered4 = value;
                                                          pageDay = '02';
                                                          pageMonth = '06';
                                                          backgroundImage = 3;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '02 june',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered4
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'godrej one',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered4
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'The cafe is designed to provide the daily...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered4
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle = 'neustar';
                                                          pageDay = '11';
                                                          pageMonth = '08';
                                                          backgroundImage = 4;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered5 = value;
                                                          pageDay = '11';
                                                          pageMonth = '08';
                                                          backgroundImage = 4;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '11 august',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered5
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'neustar',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered5
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'This bright, alry space also has its own AV system...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered5
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                is2017
                                    ? Container()
                                    : DelayedDisplay(
                                        delay: Duration(milliseconds: 500),
                                        child: Container(
                                          width: constraints.maxWidth < 600
                                              ? 400
                                              : 600,
                                          height: 400,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle =
                                                              'middle school';
                                                          pageDay = '14';
                                                          pageMonth = '01';
                                                          backgroundImage = 0;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered1 = value;
                                                          pageDay = '14';
                                                          pageMonth = '01';
                                                          backgroundImage = 0;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '14 january',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered1
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'middle school',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered1
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'This public school is designed with tree basic...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered1
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle =
                                                              'harbert office';
                                                          pageDay = '22';
                                                          pageMonth = '02';
                                                          backgroundImage = 1;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered2 = value;
                                                          pageDay = '22';
                                                          pageMonth = '02';
                                                          backgroundImage = 1;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '22 february',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered2
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'harbert office',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered2
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'B.T. Harbert International, a construction...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered2
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                                                widget.boxSized =
                                                                    !widget
                                                                        .boxSized;
                                                                pageTitle =
                                                                    'justice center';
                                                                pageDay = '30';
                                                                pageMonth =
                                                                    '03';
                                                                backgroundImage =
                                                                    2;
                                                              });
                                                            },
                                                            onHover: (value) {
                                                              setState(() {
                                                                isHovered3 =
                                                                    value;
                                                                pageDay = '30';
                                                                pageMonth =
                                                                    '03';
                                                                backgroundImage =
                                                                    2;
                                                              });
                                                            },
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '30 march',
                                                                  style:
                                                                      TextStyle(
                                                                    color: isHovered3
                                                                        ? Colors.grey[
                                                                            300]
                                                                        : Colors
                                                                            .grey,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 12),
                                                                Text(
                                                                  'justice center',
                                                                  style:
                                                                      TextStyle(
                                                                    color: isHovered3
                                                                        ? Colors.grey[
                                                                            500]
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  'With a need to accommodate a growing population...',
                                                                  style:
                                                                      TextStyle(
                                                                    color: isHovered3
                                                                        ? Colors.grey[
                                                                            500]
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                                  Spacer(),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  //  Spacer(),
                                                  Container(
                                                    height: 200,
                                                    width: 200,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle =
                                                              'kia training';
                                                          pageDay = '12';
                                                          pageMonth = '06';
                                                          backgroundImage = 3;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered4 = value;
                                                          pageDay = '12';
                                                          pageMonth = '06';
                                                          backgroundImage = 3;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '12 june',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered4
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'kia training',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered4
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'The training facility site is a 30-acre common farm...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered4
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
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
                                                          widget.boxSized =
                                                              !widget.boxSized;
                                                          pageTitle =
                                                              'golden residence';
                                                          pageDay = '15';
                                                          pageMonth = '12';
                                                          backgroundImage = 4;
                                                        });
                                                      },
                                                      onHover: (value) {
                                                        setState(() {
                                                          isHovered5 = value;
                                                          pageDay = '15';
                                                          pageMonth = '12';
                                                          backgroundImage = 4;
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '15 december',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered5
                                                                  ? Colors
                                                                      .grey[300]
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(height: 12),
                                                          Text(
                                                            'golden residence',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered5
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            'This owners wanted heir house to have a main level...',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color: isHovered5
                                                                  ? Colors
                                                                      .grey[500]
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                Spacer(flex: 2),
                              ],
                            ),
                            Spacer(flex: 30),
                          ],
                        ),
            );
          },
        ),
      ],
    );
  }
}
