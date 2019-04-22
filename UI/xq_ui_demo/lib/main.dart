import 'package:flutter/material.dart';

import 'xq_label.dart';

void main() => runApp(MyApp());

// 初始化app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // 首页
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// widget 相当于 vc
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

// state 相当于view
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      //导航到新路由
      // Navigator.push(context, new MaterialPageRoute(builder: (context) {
      //   return new NewRoute();
      // }));

//导航到新路由
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return new XQLabelRoute();
      }));
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                const Text('I\'m dedicating every day to you'),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart.  asdjkqwehkqwehkqjeasdjkqwehkqwehkqje\nasdjkqwehkqwehkqjeasdjkqwehkqwehkqjeasdjkqwehkqwehkqjeasdjkqwehkqwehkqjeasdjkqwehkqwehkqje'),
                const Text('And I thought I was so smart'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
