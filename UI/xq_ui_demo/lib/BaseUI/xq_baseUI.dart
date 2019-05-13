import 'package:flutter/material.dart';

import 'xq_label.dart';
import 'xq_listView.dart';
import 'xq_button.dart';
import 'xq_image.dart';
import 'xq_switch.dart';
import 'xq_tabBar.dart';
import 'xq_bottomTabBar.dart';
import 'xq_textField.dart';
import 'xq_web.dart';
import 'xq_form.dart';
import 'xq_alert.dart';

// widget 相当于 vc
class XQBaseUIRoute extends StatefulWidget {
// state 相当于view
  @override
  _XQBaseUIRoute createState() => _XQBaseUIRoute();
}

class _XQBaseUIRoute extends State<XQBaseUIRoute> {
  var _words = <XQBaseUIModel>[
    XQBaseUIModel(XQBaseUIListItemType.label, "label"),
    XQBaseUIModel(XQBaseUIListItemType.button, "button"),
    XQBaseUIModel(XQBaseUIListItemType.image, "image"),
    XQBaseUIModel(XQBaseUIListItemType.xq_switch, "switch"),
    XQBaseUIModel(XQBaseUIListItemType.textField, "输入框"),
    XQBaseUIModel(XQBaseUIListItemType.form, "表单"),
    XQBaseUIModel(XQBaseUIListItemType.xq_tabBar, "头部tabBar"),
    XQBaseUIModel(XQBaseUIListItemType.xq_bottomTabBar, "底部tabBar"),
    XQBaseUIModel(XQBaseUIListItemType.list, "list"),
    XQBaseUIModel(XQBaseUIListItemType.web, "Web"),
    XQBaseUIModel(XQBaseUIListItemType.alert, "弹框"),
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
        title: Text("BaseUI"),
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
            XQBaseUIModel model = _words[index];

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

  void push(XQBaseUIModel model) {
    switch (model.type) {
      case XQBaseUIListItemType.list:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQListView();
          }));
        }
        break;

      case XQBaseUIListItemType.label:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQLabelRoute();
          }));
        }
        break;

      case XQBaseUIListItemType.button:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQButtonRoute();
          }));
        }
        break;

      case XQBaseUIListItemType.image:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQImageRoute();
          }));
        }
        break;

      case XQBaseUIListItemType.xq_switch:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQSwitchRoute();
          }));
        }
        break;

      case XQBaseUIListItemType.xq_tabBar:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQTabBar();
          }));
        }
        break;

      case XQBaseUIListItemType.xq_bottomTabBar:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQBottomTabBarRoute();
          }));
        }
        break;

      case XQBaseUIListItemType.textField:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new XQTextFieldRoute();
          }));
        }
        break;

      case XQBaseUIListItemType.form:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return XQFormRoute();
          }));
        }
        break;

        case XQBaseUIListItemType.web:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return XQWebRoute();
          }));
        }
        break;

        case XQBaseUIListItemType.alert:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return XQAlertRoute();
          }));
        }
        break;

      default:
    }
  }
}

enum XQBaseUIListItemType {
  unknow,
  label,
  button,
  list,
  image,
  textField,
  form,
  xq_switch,
  xq_tabBar,
  xq_bottomTabBar,
  web,
  alert,
}

class XQBaseUIModel {
  XQBaseUIModel(
    XQBaseUIListItemType type,
    String title,
  ) {
    this.type = type;
    this.title = title;
  }

  XQBaseUIListItemType type = XQBaseUIListItemType.unknow;
  String title = "";
}
