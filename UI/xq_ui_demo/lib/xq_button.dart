import 'package:flutter/material.dart';

class XQButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // scaffold 相当于有默认背景和头部导航栏
    return Scaffold(
      appBar: AppBar(
        title: Text("XQButtonRoute"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("This is RaisedButton"),
            onPressed: () => this.xq_test("RaisedButton"),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => this.xq_test("IconButton"),
          ),
          OutlineButton(
            child: Text("This is OutlineButton"),
            onPressed: () => this.xq_test("OutlineButton"),
          ),
          FlatButton(
            child: Text("This is FlatButton"),
            onPressed: () => this.xq_test("FlatButton"),
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => this.xq_test("FlatButton"),
          )
        ],
      )),
    );
  }

  void xq_test(String str) {
    print("点击了 " + str);
  }
}
