import 'package:flutter/material.dart';

class XQAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQAnimationRoute();
  }
}

class _XQAnimationRoute extends State<XQAnimationRoute> {
  var _dataArr = <XQAnimationRouteModel>[
    XQAnimationRouteModel(XQAnimationRouteType.normal, "默认")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQAnimationRoute"),
      ),
      body: ListView.builder(
        itemCount: _dataArr.length,
        itemBuilder: (BuildContext context, int index) {
          XQAnimationRouteModel model = _dataArr[index];
          return RaisedButton(
              child: Text(model._content),
              onPressed: () {
                print(model._content);
              });
        },
      ),
    );
  }
}

enum XQAnimationRouteType { normal }

class XQAnimationRouteModel {
  XQAnimationRouteModel(XQAnimationRouteType type, String content) {
    _type = type;
    _content = content;
  }

  XQAnimationRouteType _type = XQAnimationRouteType.normal;
  String _content = "";
}
