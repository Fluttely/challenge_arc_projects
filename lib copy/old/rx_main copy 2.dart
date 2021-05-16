import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import './main_controller.dart';
// import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // home: DefaultTextStyle(style: TextStyle(fontSize: 50), child: HomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget  with RxMixin {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
final mainController = MainController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // RxBuilder(
            //   // filter: () => mainController.counter != 5,
            //   builder: (BuildContext context) {
            Text('${mainController.counter}'),
            //   },
            // ),
            // CounterWidget(
            //   counter: mainController.counter,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mainController.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class CounterWidget extends StatelessWidget with RxMixin {
//   final int counter;

//   @override
//   bool filter() => counter != 3;

//   CounterWidget({Key? key, required this.counter}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Text('$counter');
//   }
// }