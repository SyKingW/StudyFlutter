import 'package:flutter/material.dart';

class XQLocalDataStorageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQLocalDataStorageRoute();
  }
}

class _XQLocalDataStorageRoute extends State<XQLocalDataStorageRoute> {
  var _dataArr = <XQAnimationRouteModel>[
    XQAnimationRouteModel(XQAnimationRouteType.normal, "默认")
  ];

  @override
  Widget build(BuildContext context) {
    
// getApplicationDocumentsDirectory().then((value) {
//       print("getApplicationDocumentsDirectory $value");
//       Stream<FileSystemEntity> stream = value.list();
//       stream.toList().then((value) {
//         print("toList $value");
//         for (FileSystemEntity item in value) {
//           print(item.path);
//         }
//       });
//     });

//     getTemporaryDirectory().then((value) {
//       print("getApplicationDocumentsDirectory $value");
//       Stream<FileSystemEntity> stream = value.list();
//       stream.toList().then((value) {
//         print("toList $value");
//         for (FileSystemEntity item in value) {
//           print(item.path);
//         }
//       });
//     });

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
