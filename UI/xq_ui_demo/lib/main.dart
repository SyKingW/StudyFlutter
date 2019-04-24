import 'package:flutter/material.dart';

import 'xq_label.dart';
import 'xq_listView.dart';
import 'xq_button.dart';
import 'xq_image.dart';
import 'xq_switch.dart';
import 'xq_tabBar.dart';
import 'xq_bottomTabBar.dart';
import 'xq_textField.dart';

import 'Animation/xq_animation.dart';

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
  var _words = <XQMainModel>[
    XQMainModel(XQMainListItemType.label, "label"),
    XQMainModel(XQMainListItemType.button, "button"),
    XQMainModel(XQMainListItemType.image, "image"),
    XQMainModel(XQMainListItemType.xq_switch, "switch"),
    XQMainModel(XQMainListItemType.textField, "输入框"),
    XQMainModel(XQMainListItemType.xq_tabBar, "头部tabBar"),
    XQMainModel(XQMainListItemType.xq_bottomTabBar, "底部tabBar"),
    XQMainModel(XQMainListItemType.list, "list"),
    XQMainModel(XQMainListItemType.animation, "动画"),
  ];

  @override
  Widget build(BuildContext context) {
//下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              print("object");
            },
          ),
          IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {
                print("object");
              }),
          IconButton(
              icon: Icon(Icons.account_balance_wallet),
              onPressed: () {
                print("object");
              })
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemCount: _words.length,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            XQMainModel model = _words[index];

            return RaisedButton(
              child: Text(model.title),
              onPressed: (() {
                switch (model.type) {
                  case XQMainListItemType.list:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQListView();
                      }));
                    }
                    break;

                  case XQMainListItemType.label:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQLabelRoute();
                      }));
                    }
                    break;

                  case XQMainListItemType.button:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQButtonRoute();
                      }));
                    }
                    break;

                  case XQMainListItemType.image:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQImageRoute();
                      }));
                    }
                    break;

                  case XQMainListItemType.xq_switch:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQSwitchRoute();
                      }));
                    }
                    break;

                  case XQMainListItemType.xq_tabBar:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQTabBar();
                      }));
                    }
                    break;

                  case XQMainListItemType.xq_bottomTabBar:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQBottomTabBarRoute();
                      }));
                    }
                    break;

                  case XQMainListItemType.animation:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQAnimationRoute();
                      }));
                    }
                    break;

                  case XQMainListItemType.textField:
                    {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return new XQTextFieldRoute();
                      }));
                    }
                    break;

                  default:
                }
              }),
            );
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
        ),
      ),
    );
  }
}

enum XQMainListItemType {
  unknow,
  label,
  button,
  list,
  image,
  textField,
  xq_switch,
  xq_tabBar,
  xq_bottomTabBar,
  animation,
}

class XQMainModel {
  XQMainModel(
    XQMainListItemType type,
    String title,
  ) {
    this.type = type;
    this.title = title;
  }

  XQMainListItemType type = XQMainListItemType.unknow;
  String title = "";
}
