import 'package:flutter/material.dart';

class Xq_push extends StatefulWidget {
	@override
	Xq_pushView createState() {
		return Xq_pushView();
	}
}

class Xq_pushView extends Xq_pushState {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(title: Text('Xq_push'),),
      body: Center(
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
	}
}

abstract class Xq_pushState extends State<Xq_push> {
	// TODO: implement state
}
