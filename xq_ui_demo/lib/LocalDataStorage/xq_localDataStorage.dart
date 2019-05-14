import 'package:flutter/material.dart';
import 'xq_localds_preferences.dart';

class XQLocalDataStorageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQLocalDataStorageRoute();
  }
}

class _XQLocalDataStorageRoute extends State<XQLocalDataStorageRoute> {
  var _dataArr = <XQLocalDataStorageModel>[
    XQLocalDataStorageModel(XQLocalDataStorageType.preferences, "preferences"),
    XQLocalDataStorageModel(XQLocalDataStorageType.file, "file"),
    XQLocalDataStorageModel(XQLocalDataStorageType.sqlite, "sqlite"),
  ];

  void _onPressedBtn(XQLocalDataStorageModel model) {
    switch (model._type) {
      case XQLocalDataStorageType.preferences:
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new Xq_localds_preferences();
          }));
        }
        break;

      case XQLocalDataStorageType.file:
        {}
        break;

      case XQLocalDataStorageType.sqlite:
        {}
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQAnimationRoute"),
      ),
      body: ListView.builder(
        itemCount: _dataArr.length,
        itemBuilder: (BuildContext context, int index) {
          XQLocalDataStorageModel model = _dataArr[index];
          return RaisedButton(
              child: Text(model._content),
              onPressed: () {
                _onPressedBtn(model);
              });
        },
      ),
    );
  }
}

enum XQLocalDataStorageType { preferences, file, sqlite }

class XQLocalDataStorageModel {
  XQLocalDataStorageModel(XQLocalDataStorageType type, String content) {
    _type = type;
    _content = content;
  }

  XQLocalDataStorageType _type = XQLocalDataStorageType.preferences;
  String _content = "";
}
