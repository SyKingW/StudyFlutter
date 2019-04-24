import 'package:flutter/material.dart';

class XQTextFieldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQTextFieldRoute();
  }
}

class _XQTextFieldRoute extends State<XQTextFieldRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQTextFieldRoute"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onTap: () {
              print("onTap");
            },
            onChanged: (value) {
              print(value);
            },
            onSubmitted: (value) {
              print(value);
            },
            onEditingComplete: () {
              print("onEditingComplete");
            },
          )
        ],
      ),
    );
  }
}
