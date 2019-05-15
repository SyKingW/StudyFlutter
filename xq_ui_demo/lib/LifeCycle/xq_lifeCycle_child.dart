import 'package:flutter/material.dart';

class Xq_lifeCycle_child extends StatefulWidget {
  @override
  Xq_lifeCycle_childView createState() {
    return Xq_lifeCycle_childView();
  }
}

class Xq_lifeCycle_childView extends Xq_lifeCycle_childState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xq_lifeCycle_child'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("pop"),
            onPressed: () {
              Navigator.pop(context, "哈哈");
            },
          ),
        ],
      )),
    );
  }
}

abstract class Xq_lifeCycle_childState extends State<Xq_lifeCycle_child>
    with WidgetsBindingObserver {
  @override
  Future<bool> didPopRoute() {
    print("Xq_lifeCycle_childState didPopRoute");
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print("Xq_lifeCycle_childState didPushRoute");
    return super.didPushRoute(route);
  }

  @override
  void dispose() {
    print("Xq_lifeCycle_childState dispose");
    super.dispose();
  }
}
