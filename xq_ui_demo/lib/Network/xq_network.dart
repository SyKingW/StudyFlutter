import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';

class XQNetworkRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQNetworkRoute();
  }
}

class _XQNetworkRoute extends State<XQNetworkRoute> {
  void _xq_get() {
    // 初始化http对象
    HttpClient http = HttpClient();
    // Uri uri = Uri(scheme: "https", host: "www.baidu.com", queryParameters: {});
    Uri uri = Uri.parse("https://www.baidu.com");
    http.getUrl(uri).then((onValue) {
      print(onValue);

      onValue.close().then((response) {
        print(response);
        if (response.statusCode == HttpStatus.ok) {
          response.transform(Utf8Decoder()).join().then((onValue) {
            print(onValue);
          }).catchError((onError) {
            print(onError);
          });
        } else {
          print("获取失败");
        }
      }).catchError((onError) {
        print(onError);
      }).whenComplete(() {
        print("close完成");
      });
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
      http.close();
    });
  }

  void _xq_post() {
    HttpClient http = HttpClient();
    Uri uri = Uri(
        scheme: "http",
        host: "192.168.1.96:8300/LoginRegist/CheckSessionId",
        queryParameters: {"obj": "value"});

    http.postUrl(uri).then((onValue) {
      print(onValue);
      onValue.close().then((response) {
        print(response);
        if (response.statusCode == HttpStatus.ok) {
          response.transform(Utf8Decoder()).join().then((onValue) {
            print(onValue);
          }).catchError((onError) {
            print(onError);
          });
        } else {
          print("获取失败");
        }
      }).catchError((onError) {
        print(onError);
      }).whenComplete(() {
        print("close完成");
      });
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
      http.close();
    });
  }

  void _xq_http_get() {
    var client = Client();
    client.get("https://www.baidu.com").then((onValue) {
      print("asdajshdk $onValue");
      print(onValue.body);
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
      // 一般来说, 应该是不用关闭的, 一开始就创建一个类来持有
      client.close();
    });
  }

  void _xq_http_post() {
    var client = Client();
    client.post("http://192.168.1.96:8300/LoginRegist/CheckSessionId",
        body: {"object": "value"}).then((onValue) {
      print(onValue.body);
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
      client.close();
    });
  }

  void _xq_dio_get() {
    var dio = Dio();
    dio.get("https://www.baidu.com").then((onValue) {
      print("asdajshdk $onValue");
      print(onValue.data);
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
    });
  }

  void _xq_dio_post() {
    var dio = Dio();
    dio.post("http://192.168.1.96:8300/LoginRegist/CheckSessionId",
        queryParameters: {"object": "value"}).then((onValue) {
      print(onValue.data);
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
    });
  }

  void _xq_dio_download() {
    getTemporaryDirectory().then((onValue) {
      String savePath = onValue.path + "/" + DateTime.now().toString() + ".mp4";
      print("savePath: $savePath");
      var dio = Dio();
      dio.download(
          "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", savePath,
          onReceiveProgress: (progress, total) {
        // b 进制
        print("进度: $progress, $total");
      }).then((onValue) {
        print(onValue);
      }).catchError((onError) {
        print(onError);
      }).whenComplete(() {
        print("whenComplete");
      });
    });
  }

  void _xq_dio_upload() {
    var dio = Dio();
    FormData formData = new FormData.from({
      "name": "wendux",
      "age": 25,
      "file1": new UploadFileInfo(new File("./upload.txt"), "upload1.txt"),
      "file2": new UploadFileInfo(new File("./upload.txt"), "upload2.txt"),
      // 支持文件数组上传
      "files": [
        new UploadFileInfo(new File("./example/upload.txt"), "upload.txt"),
        new UploadFileInfo(new File("./example/upload.txt"), "upload.txt")
      ]
    });
    dio.post("path", data: formData).then((onValue) {
      print(onValue);
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      print("whenComplete");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQAnimationRoute"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text("原生Get"), onPressed: _xq_get),
            RaisedButton(child: Text("原生Post"), onPressed: _xq_post),
            RaisedButton(child: Text("http Get"), onPressed: _xq_http_get),
            RaisedButton(child: Text("http Post"), onPressed: _xq_http_post),
            RaisedButton(child: Text("dio Get"), onPressed: _xq_dio_get),
            RaisedButton(child: Text("dio Post"), onPressed: _xq_dio_post),
            RaisedButton(
                child: Text("dio download"), onPressed: _xq_dio_download),
                RaisedButton(
                child: Text("dio upload"), onPressed: _xq_dio_upload),
          ],
        ),
      ),
    );
  }
}
