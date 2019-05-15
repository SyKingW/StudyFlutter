import 'package:flutter/material.dart';

class Xq_data_transport extends StatefulWidget {
  @override
  Xq_data_transportView createState() {
    return Xq_data_transportView();
  }
}

class Xq_data_transportView extends Xq_data_transportState {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Xq_data_transport'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("代理"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("block 回调"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("通知"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

abstract class Xq_data_transportState extends State<Xq_data_transport> {
  // TODO: implement state
}
