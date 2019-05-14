import 'package:flutter/material.dart';

import 'package:xq_test_one/xq_test_one.dart';
import 'package:xq_test_get_resource_path/xq_test_get_resource_path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int _counter = 0;
  String _platformVersion = "";
  String _batteryLevel = "";

  @override
  void initState() {
    super.initState();
    XqTestGetResourcePath.platformVersion.then((onValue) {
      setState(() {
        _platformVersion = onValue;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counter = XqTestOne.add(_counter, _counter);
    });
  }

  void _xq_sub() {
    setState(() {
      _counter = XqTestOne.sub(_counter, 2);
    });
  }

  void _xq_getBatteryLevel() {
    XqTestGetResourcePath.getBatteryLevel().then((onValue) {
      setState(() {
        _batteryLevel = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(_platformVersion),
            Text(_batteryLevel),
            RaisedButton(
              onPressed: _xq_sub,
              child: Icon(Icons.add),
            ),
            RaisedButton(onPressed: _xq_getBatteryLevel, child: Text("获取电量")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
