import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Xq_localds_preferences extends StatefulWidget {
	@override
	Xq_localds_preferencesView createState() {
		return Xq_localds_preferencesView();
	}
}

class Xq_localds_preferencesView extends Xq_localds_preferencesState {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(title: Text('Xq_localds_preferences'),),
      body: Center(
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
	}
}

abstract class Xq_localds_preferencesState extends State<Xq_localds_preferences> {

}
