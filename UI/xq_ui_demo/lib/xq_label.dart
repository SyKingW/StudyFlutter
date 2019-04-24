import 'package:flutter/material.dart';

class XQLabelRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    // scaffold 相当于有默认背景和头部导航栏
    return Scaffold(
      appBar: AppBar(
        title: Text("XQLabelRoute"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }



}
