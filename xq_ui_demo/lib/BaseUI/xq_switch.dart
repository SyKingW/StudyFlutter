import 'package:flutter/material.dart';

// widget
class XQSwitchRoute extends StatefulWidget {
  @override
  _XQSwitchRoute createState() => new _XQSwitchRoute();
}

// state
class _XQSwitchRoute extends State<XQSwitchRoute> {
  // 不得不说这个要自己维护， 还是有点坑的....widget并不会去帮你保存
  bool _switchSelected = false; //维护单选开关状态
  bool _checkboxSelected = false; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    print("build");

    var listWidget = <Widget>[
      _switchSelected
          ? Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            )
          : Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                  if (_checkboxSelected) {
                    _switchSelected = true;
                  }
                });
              },
            )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("XQSwitchRoute"),
      ),
      body: Column(
        children: listWidget,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(XQSwitchRoute oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

/**
 * initState: 插入渲染树时调用，只调用一次
 * didChangeDependencies: state依赖的对象发生变化时调用
 * didUpdateWidget: 组件状态改变时候调用，可能会调用多次
 * build: 构建Widget时调用
 * deactivate: 当移除渲染树的时候调用
 * dispose: 组件即将销毁时调用
 * 
 * 调用 setState 会重新 build
 * 
 * initState -> didChangeDependencies -> build -> deactivate -> dispose
 * 
 * 自己测试并没有发现有调用 didUpdateWidget
 *  
 */

}
