import 'package:flutter/material.dart';

import 'BaseUI/xq_baseUI.dart';
import 'Animation/xq_animation.dart';
import 'Bluetooth/xq_bluetooth.dart';
import 'LocalDataStorage/xq_localDataStorage.dart';
import 'Network/xq_network.dart';
import 'Other/xq_other.dart';

void main() => runApp(MyApp());

// 初始化app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XQ Flutter Demo',
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
    XQMainModel(XQMainListItemType.baseUI, "基础UI"),
    XQMainModel(XQMainListItemType.gesture, "手势"),
    XQMainModel(XQMainListItemType.animation, "动画"),
    XQMainModel(XQMainListItemType.network, "网络请求"),
    XQMainModel(XQMainListItemType.localDataStorage, "本地数据"),
    XQMainModel(XQMainListItemType.bluetooth, "蓝牙"),
    XQMainModel(XQMainListItemType.other, "其他"),
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
                this.push(model);
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

  void push(XQMainModel model) {
    switch (model.type) {
      case XQMainListItemType.baseUI:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQBaseUIRoute();
          }));
        }
        break;

      case XQMainListItemType.animation:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQAnimationRoute();
          }));
        }
        break;

      case XQMainListItemType.network:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQNetworkRoute();
          }));
        }
        break;

      case XQMainListItemType.bluetooth:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQBLuetoothRout();
          }));
        }
        break;

      case XQMainListItemType.other:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQOtherRoute();
          }));
        }
        break;

      case XQMainListItemType.localDataStorage:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQLocalDataStorageRoute();
          }));
        }
        break;

      case XQMainListItemType.gesture:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQLocalDataStorageRoute();
          }));
        }
        break;

      default:
    }
  }
}

enum XQMainListItemType {
  unknow,
  baseUI,
  gesture,
  animation,
  network,
  localDataStorage,
  bluetooth,
  other,
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
