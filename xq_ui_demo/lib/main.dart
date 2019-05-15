import 'package:flutter/material.dart';

import 'BaseUI/xq_baseUI.dart';
import 'Animation/xq_animation.dart';
import 'Bluetooth/xq_bluetooth.dart';
import 'LocalDataStorage/xq_localDataStorage.dart';
import 'Network/xq_network.dart';
import 'Other/xq_other.dart';
import 'LifeCycle/xq_lifeCycle.dart';
import 'Notification/xq_notification.dart';
import 'DataTransport/xq_data_transport.dart';
import 'Push/xq_push.dart';

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
    XQMainModel(XQMainListItemType.lifeCycle, "App和Route生命周期"),
    XQMainModel(XQMainListItemType.baseUI, "基础UI"),
    XQMainModel(XQMainListItemType.gesture, "手势"),
    XQMainModel(XQMainListItemType.animation, "动画"),
    XQMainModel(XQMainListItemType.push, "页面的跳转"),
    XQMainModel(XQMainListItemType.dataTransport, "数据传输"),
    XQMainModel(XQMainListItemType.localDataStorage, "本地数据"),
    XQMainModel(XQMainListItemType.network, "网络请求"),
    XQMainModel(XQMainListItemType.notification, "通知"),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQBaseUIRoute();
          }));
        }
        break;

      case XQMainListItemType.animation:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQAnimationRoute();
          }));
        }
        break;

      case XQMainListItemType.network:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQNetworkRoute();
          }));
        }
        break;

      case XQMainListItemType.bluetooth:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQBLuetoothRout();
          }));
        }
        break;

      case XQMainListItemType.other:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQOtherRoute();
          }));
        }
        break;

      case XQMainListItemType.localDataStorage:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQLocalDataStorageRoute();
          }));
        }
        break;

      case XQMainListItemType.gesture:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return XQLocalDataStorageRoute();
          }));
        }
        break;

        case XQMainListItemType.lifeCycle:
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Xq_lifeCycle();
          }));
        }
        break;

        case XQMainListItemType.notification: {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Xq_notification();
          }));
        }
        break;

        case XQMainListItemType.dataTransport: {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Xq_data_transport();
          }));
        }
        break;

        case XQMainListItemType.push: {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Xq_push();
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
  dataTransport,
  network,
  localDataStorage,
  push,
  notification,
  bluetooth,
  lifeCycle,
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
