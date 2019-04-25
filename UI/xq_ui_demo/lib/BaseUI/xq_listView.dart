import 'package:flutter/material.dart';


class XQListView extends StatelessWidget {

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
//下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Center(
        // child: Column(
        // children: <Widget>[
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   ],
        // ),

        child: ListView.separated(
          itemCount: _words.length,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            //如果到了表尾
            if (_words[index] == loadingTag) {
              //不足100条，继续获取数据
              if (_words.length - 1 < 20) {
                //获取数据
                _retrieveData();
                //加载时显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0)),
                );
              } else {
                //已经加载了100条数据，不再获取数据。
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ));
              }
            }

            return ListTile(title: Text(_words[index]));
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
        ),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      // 插入数据
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          ["sd", "123\nasda\nasdwe\nasdqwhke"]);
    });
  }
}

