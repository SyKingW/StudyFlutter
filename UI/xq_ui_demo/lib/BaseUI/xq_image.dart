import 'package:flutter/material.dart';

class XQImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // scaffold 相当于有默认背景和头部导航栏
    return Scaffold(
      appBar: AppBar(
        title: Text("XQImageRoute"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 这里有个坑, 第一次进来没有网络的时候， 会直接加载失败
            Image.network(
              "https://www.baidu.com/img/bd_logo1.png",
              width: 300,
            ),
            Image(
              image: NetworkImage("https://www.baidu.com/img/bd_logo1.png"),
              width: 200,
            ),
            Image.asset("assets/images/1.gif"),
            Image.asset("assets/images/2.png")
          ],
        ),
      )),
    );
  }
}
