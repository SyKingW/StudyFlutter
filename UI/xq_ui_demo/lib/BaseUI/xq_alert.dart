import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xq_dialog_plugin/xq_customDialog.dart';

class XQAlertRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQAlertRoute();
  }
}

class _XQAlertRoute extends State<XQAlertRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("SimpleDialog"),
              onPressed: () {
                this.xq_showDialog1(context);
              },
            ),
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed: () {
                this.xq_showDialog(context);
              },
            ),
            RaisedButton(
              child: Text("iOS样式CupertinoAlertDialog"),
              onPressed: () {
                this.xq_showCupertinoDialog(context);
              },
            ),
            RaisedButton(
              child: Text("AlertDialog 超出屏幕"),
              onPressed: () {
                this.xq_showDialog_AlertDialog(context);
              },
            ),
            RaisedButton(
              child: Text("AlertDialog 超出屏幕不带ScrollView"),
              onPressed: () {
                this.xq_showDialog_AlertDialog1(context);
              },
            ),
            RaisedButton(
              child: Text("底部弹框showBottomSheet"),
              onPressed: () {
                this.xq_showBottomSheet(context);
              },
            ),
            RaisedButton(
              child: Text("showAboutDialog"),
              onPressed: () {
                this.xq_showAboutDialog(context);
              },
            ),
            RaisedButton(
              child: Text("自定义showGeneralDialog"),
              onPressed: () {
                this.xq_showGeneralDialog(context);
              },
            ),
            RaisedButton(
              child: Text("自定义进度弹框"),
              onPressed: () {
                this.xq_showProgress(context);
              },
            ),
            RaisedButton(
              child: Text("输入弹框"),
              onPressed: () {
                this.xq_showInputDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void xq_showInputDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return XQInputDialog(
            text: "标题",
            message: "内容\n哈哈\nqwhekjqwehkj",
          );
        });
  }

  void xq_showProgress(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return XQLoadingDialog(
            //调用对话框
            text: '正在获取详情...',
          );
        });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

// 自定义弹框
  void xq_showGeneralDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        // barrierLabel: "barrierLabel",
        barrierDismissible: false, // 必填
        transitionDuration: Duration(milliseconds: 400), // 必填
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialog(
            title: Text('这是标题'),
            content: Text('这是内容'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void xq_showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationIcon: Icon(Icons.access_alarms),
      applicationName: "applicationName",
      applicationVersion: "applicationVersion",
      applicationLegalese: "applicationLegalese",
    );
  }

  void xq_showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 300.0,
            child: Column(
              children: <Widget>[
                Text("11111111"),
                Text("22222222"),
                Text("33333333"),
              ],
            ));
      },
    ).then((val) {
      print(val);
    });
  }

  void xq_showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("title"),
          semanticLabel: "semanticLabel",
          children: <Widget>[
            SimpleDialogOption(
              child: Text("1"),
              onPressed: () {
                print("1");
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: Text("2"),
              onPressed: () {
                print("2");
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: Text("3"),
              onPressed: () {
                print("3");
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void xq_showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("title"),
            content: Text("content"),
            actions: <Widget>[
              SimpleDialogOption(
                child: Text("确定"),
                onPressed: () {
                  print("确定");
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void xq_showCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("title"),
            content: Text("content"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("确定"),
                onPressed: () {
                  print("确定");
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void xq_showDialog_AlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("title"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消"),
              ),
            ],
          );
        });
  }

  void xq_showDialog_AlertDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("title"),
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
                SizedBox(
                  height: 100,
                  child: Text("1"),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消"),
              ),
            ],
          );
        });
  }
}