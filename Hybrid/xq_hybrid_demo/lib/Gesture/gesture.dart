import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
	@override
	GestureView createState() {
		return GestureView();
	}
}

class GestureView extends State<GestureRoute> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(title: Text("GestureRoute"),),
      body: Center(
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
	}
}

