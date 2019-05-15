import 'package:flutter/material.dart';

class Xq_notification extends StatefulWidget {
	@override
	Xq_notificationView createState() {
		return Xq_notificationView();
	}
}

class Xq_notificationView extends Xq_notificationState {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(title: Text('Xq_notification')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("跨页面通知传输数据"),
              onPressed: () {

              },
            ),
            RaisedButton(
              child: Text("本地通知"),
              onPressed: () {

              },
            ),
            RaisedButton(
              child: Text("远程通知(APNs这些)"),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
	}
}

abstract class Xq_notificationState extends State<Xq_notification> {
	// TODO: implement state
}
