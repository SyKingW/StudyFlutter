import 'package:flutter/material.dart';

class XQFormRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQFormRoute();
  }
}

class _XQFormRoute extends State<XQFormRoute> {
  var _node1 = FocusNode();
  var _node2 = FocusNode();
  FocusScopeNode _fsn;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Scaffold s = Scaffold(
      appBar: AppBar(
        title: Text("XQTextFieldRoute"),
      ),
      body: Form(
        key: _formKey,
        onChanged: () {
          // 监听文字改变
          print("onChanged");
        },
        
        child: Column(
          children: <Widget>[
            TextFormField(
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

              onSaved: (value) {
                print("onSaved $value");
              },

              onFieldSubmitted: (value) {
                print("onSubmitted $value");
              },
              onEditingComplete: () {
                print("onEditingComplete");
                _fsn.requestFocus(_node2);
              },

              validator: (value) {
                return value.length < 6 ? "不能少于6位" : null;
              },
            ),
            TextFormField(
              focusNode: _node2,
              // 隐藏输入文字
              obscureText: true,
              onSaved: (value) {
                print("onSaved $value");
              },

              onFieldSubmitted: (value) {
                print("onSubmitted $value");
              },
              onEditingComplete: () {
                print("onEditingComplete");
                _node2.unfocus();
              },

              validator: (value) {
                return value.length < 6 ? "不能少于8位" : null;
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
                _node1.unfocus();
                _node2.unfocus();
              },
            ),
            RaisedButton(
              child: Text("登录"),
              onPressed: () {
                this.login();
              },
            ),
          ],
        ),
      ),
    );

    if (_fsn == null) {
      // 第一次进来
      _fsn = FocusScope.of(context);
      // _fsn.requestFocus(_node1);
    }

    return s;
  }

  void login() {
    _node1.unfocus();
    _node2.unfocus();

    if (_formKey.currentState.validate()) {
      print("验证成功");
    }else {
      print("验证失败");
    }
  }

  @override
  void dispose() {
    super.dispose();
    // 不 dispose ，好像系统并不会释放掉.....
    _node1.dispose();
    _node2.dispose();
  }
}
