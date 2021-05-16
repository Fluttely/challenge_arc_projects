import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import './main_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
  final mainController = MainController();
  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text('${mainController.counter}'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: mainController.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
