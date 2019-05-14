import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart'
    show AssetBundle, BinaryMessages, rootBundle;

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
  WebViewController _webViewCtl;

  String _url = "http://apphelp.lmiot.com.cn:9011/AboutUs_zzyzn.html";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("XQWebRoute"),
          actions: <Widget>[
            IconButton(
              icon: Text("保存文件"),
              onPressed: () {
                this.xq_test();
              },
            ),
            IconButton(
              icon: Text("读取文件内容"),
              onPressed: () {
                this.xq_getFile();
              },
            ),
            IconButton(
              icon: Text("刷新WebView"),
              onPressed: () {
                this.xq_getPath().then((value) {
                  Uri uri = Uri.file(value);
                  _url = uri.toString();
                  // _url = "http://" + uri.path;
                  // _url = "https://www.baidu.com";
                  if (_webViewCtl != null) {
                    print(_url);
                    _webViewCtl.loadUrl(_url);
                  }
                });
              },
            )
          ],
        ),
        body: WebView(
          initialUrl: _url,
          onPageFinished: (value) {
            // 加载成功
            print("onPageFinished: $value");
          },
          onWebViewCreated: (value) {
            print("onWebViewCreated: $value");
            _webViewCtl = value;
          },
          navigationDelegate: (value) {
            print("navigationDelegate: $value");
            // 在这里可以进行拦截跳转
            return NavigationDecision.navigate;
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

  Future<String> xq_getPath() async {
//     getApplicationDocumentsDirectory().then((value) {
// value.path + "/html/Index.html";
//     });
    Directory d = await getApplicationDocumentsDirectory();
    return d.path + "/html/Index.html";
  }

  void xq_test() {
    getApplicationDocumentsDirectory().then((value) {
      Directory d = Directory(value.path + "/html");
      d.exists().then((value) {
        if (value) {
          this.xq_createFile(d.path);
        } else {
          d.create().then((value) {
            this.xq_createFile(d.path);
          }).catchError(() {
            print("创建失败");
          });
        }
      });
    });
  }

  void xq_createFile(path) {
    File f = File(path + "/Index.html");
    f.exists().then((value) {
      if (!value) {
        print("文件不存在");
        f.create().then((value) {
          print("创建文件成功");
          this.xq_writeFile(f);
        });
      } else {
        print("文件存在: " + f.path);

        f.delete().then((value) {
          print("删除成功");
          this.xq_writeFile(f);
        });

        // this.xq_reload(f.uri.toString());
      }
    });
  }

  void xq_writeFile(File f) {
    // File f = File(path);
    rootBundle.loadString("assets/html/Index.html").then((value) {
      if (value.length != 0) {
        f.writeAsString(value).then((value) {
          print("写入文件成功");
          this.xq_reload(f.uri.toString());
        }).catchError(() {
          print("写入失败");
        });
      }
    });
  }

  void xq_getFile() {
    this.xq_getPath().then((value) {
      File f = File(value);
      f.readAsString().then((value) {
        print(value);
      });
    });
  }

  void xq_reload(String path) {
    // _url = "file://" + path;

    // Uri u = Uri.file(path);
    // _url = u.path;

    _url = path;

    print(_url);
    if (_webViewCtl != null) {
      _webViewCtl.loadUrl(_url);
    }
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
