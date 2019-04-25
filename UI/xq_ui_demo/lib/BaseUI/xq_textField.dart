import 'package:flutter/material.dart';

class XQTextFieldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQTextFieldRoute();
  }
}

class _XQTextFieldRoute extends State<XQTextFieldRoute> {
  XQFocusNode _node1 = XQFocusNode();
  XQFocusNode _node2 = XQFocusNode();
  FocusScopeNode _fsn;

  @override
  Widget build(BuildContext context) {
    Scaffold s = Scaffold(
        appBar: AppBar(
          title: Text("XQTextFieldRoute"),
        ),
        body: GestureDetector(
          onTap: () {
            print("GonTap");
            this.hideKeyboard();
          },
          child: Column(
            children: <Widget>[
              TextField(
                // 页面出现自动跳出键盘
                autofocus: true,
                focusNode: _node1,
                // 键盘颜色
                keyboardAppearance: Brightness.light,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    // 这个是会连下面的横线都会挤过去的 icon
                    // icon: Icon(Icons.access_alarms),
                    prefixIcon: Icon(Icons.access_alarms),
                    // 没有焦点的时候在中间的提示文字, 有焦点后在上方
                    labelText: "账号",
                    // 有焦点时， 在中间的提示文字
                    hintText: "账号不能输入数字"),
                onTap: () {
                  print("onTap");
                },
                onChanged: (value) {
                  print("onChanged $value");
                },
                onSubmitted: (value) {
                  print("onSubmitted $value");
                },
                onEditingComplete: () {
                  print("onEditingComplete");
                  _fsn.requestFocus(_node2);
                },
              ),
              TextField(
                focusNode: _node2,
                // 隐藏输入文字
                obscureText: true,
                onTap: () {
                  print("onTap");
                },
                onChanged: (value) {
                  print("onChanged $value");
                },
                onSubmitted: (value) {
                  print("onSubmitted $value");
                },
                onEditingComplete: () {
                  print("onEditingComplete");
                  _node2.unfocus();
                },
              ),
              RaisedButton(
                child: Text("切换焦点"),
                onPressed: () {
                  if (_node1.hasFocus) {
                    _fsn.requestFocus(_node2);
                  } else {
                    _fsn.requestFocus(_node1);
                  }
                },
              ),
              RaisedButton(
                child: Text("隐藏键盘"),
                onPressed: () {
                  this.hideKeyboard();
                },
              ),
            ],
          ),
        ));

    if (_fsn == null) {
      // 第一次进来
      _fsn = FocusScope.of(context);
      // _fsn.requestFocus(_node1);
    }

    return s;
  }

  void hideKeyboard() {
    _node1.unfocus();
    _node2.unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    // 不 dispose ，好像系统并不会释放掉.....
    _node1.dispose();
    _node2.dispose();
  }
}

class XQFocusNode extends FocusNode {
  @override
  void dispose() {
    super.dispose();
    print("XQFocusNode dispose");
  }
}
