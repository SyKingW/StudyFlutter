import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

/**
 * iOS 需要在 Info.plist 添加 
 * key: io.flutter.embedded_views_preview 
 * valeu: YES.
 */
import 'package:webview_flutter/webview_flutter.dart';

class XQWebRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQWebRoute();
  }
}

class _XQWebRoute extends State<XQWebRoute> {
  WebViewController _webViewCtl = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getApplicationDocumentsDirectory().then((value) {
      print("getApplicationDocumentsDirectory $value");
      Stream<FileSystemEntity> stream = value.list();
      stream.toList().then((value) {
        print("toList $value");
        for (FileSystemEntity item in value) {
          print(item.path);
        }
      });
    });

    getTemporaryDirectory().then((value) {
      print("getApplicationDocumentsDirectory $value");
      Stream<FileSystemEntity> stream = value.list();
      stream.toList().then((value) {
        print("toList $value");
        for (FileSystemEntity item in value) {
          print(item.path);
        }
      });
    });

    print("rootBundle: " + rootBundle.toString());

    

    return Scaffold(
        appBar: AppBar(
          title: Text("XQWebRoute"),
        ),
        body: WebView(
          initialUrl: "http://apphelp.lmiot.com.cn:9011/AboutUs_zzyzn.html",
          onPageFinished: (value) {
            // 加载成功
            print("onPageFinished: $value");
          },
          onWebViewCreated: (value) {
            print("onWebViewCreated: $value");
            _webViewCtl = value;
          },
          javascriptChannels: Set.of([
            JavascriptChannel(
                name: "jsGetConfig",
                onMessageReceived: (value) {
                  print("onMessageReceived: $value.message");
                }),
            JavascriptChannel(
                name: "jsSendConfig",
                onMessageReceived: (value) {
                  print("onMessageReceived: jsSendConfig");
                  print(value.message);
                })
          ]),
        ));
  }

  @override
  void dispose() {
    _webViewCtl = null;
    super.dispose();
  }
}

// class XQWebCtl extends WebViewController {

// }

/**
 * 
 * 这个是用 flutter_webview_plugin 库弄得
 * 但是最主要是没有 webView 和 js 的交互
 * 
 */
// 没有在这个库找到 webview 和 js 交互的库
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// class XQWebRoute extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _XQWebRoute();
//   }
// }

// class _XQWebRoute extends State<XQWebRoute> {
//   final FlutterWebviewPlugin _webPlugin = FlutterWebviewPlugin();

//   @override
//   void initState() {
//     super.initState();
//     _webPlugin.onUrlChanged.listen((url) {
//       print("onUrlChanged: $url");
//     });

//     _webPlugin.onHttpError.listen((value) {
//       print("onHttpError: $value");
//     });

//     // _webPlugin.onScrollXChanged.listen((value) {
//     //   print("onScrollXChanged: $value");
//     // });

//     // _webPlugin.onScrollYChanged.listen((value) {
//     //   print("onScrollYChanged: $value");
//     // });

//     _webPlugin.onStateChanged.listen((value) {
//       print("onStateChanged");
//       print(value.type);
//     });

//     _webPlugin.onDestroy.listen((value) {
//       print("onDestroy");
//     });

//   }

//   @override
//   Widget build(BuildContext context) {
// // 用的是第三方, flutter_webview_plugin: "0.3.4"

//     return WebviewScaffold(
//       appBar: AppBar(
//         title: Text("WebView"),
//       ),
//       // url: "https://www.baidu.com",
//       // url: "https://www.google.com",
//       url: "http://apphelp.lmiot.com.cn:9011/AboutUs_zzyzn.html",

//       initialChild: Container(
//         // color: Colors.redAccent,
//         child: Center(
//           child: Text("initialChild"),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _webPlugin.close();
//     // _webPlugin.dispose();
//     super.dispose();
//   }
// }
